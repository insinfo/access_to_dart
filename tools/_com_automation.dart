import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

final _kernel32Toolhelp = DynamicLibrary.open('kernel32.dll');

final _createToolhelp32Snapshot = _kernel32Toolhelp.lookupFunction<
  IntPtr Function(Uint32 dwFlags, Uint32 th32ProcessId),
  int Function(int dwFlags, int th32ProcessId)>('CreateToolhelp32Snapshot');

final _process32First = _kernel32Toolhelp.lookupFunction<
  Int32 Function(IntPtr hSnapshot, Pointer<ProcessEntry32Ffi> lppe),
  int Function(int hSnapshot, Pointer<ProcessEntry32Ffi> lppe)>('Process32FirstW');

final _process32Next = _kernel32Toolhelp.lookupFunction<
  Int32 Function(IntPtr hSnapshot, Pointer<ProcessEntry32Ffi> lppe),
  int Function(int hSnapshot, Pointer<ProcessEntry32Ffi> lppe)>('Process32NextW');

const _th32csSnapProcess = 0x00000002;
const _maxPath = 260;

final class ProcessEntry32Ffi extends Struct {
  @Uint32()
  external int dwSize;

  @Uint32()
  external int cntUsage;

  @Uint32()
  external int th32ProcessID;

  @IntPtr()
  external int th32DefaultHeapID;

  @Uint32()
  external int th32ModuleID;

  @Uint32()
  external int cntThreads;

  @Uint32()
  external int th32ParentProcessID;

  @Int32()
  external int pcPriClassBase;

  @Uint32()
  external int dwFlags;

  @Array(_maxPath)
  external Array<Uint16> szExeFile;
}

void initializeComApartment() {
  final hr = CoInitializeEx(nullptr, COINIT.COINIT_APARTMENTTHREADED);
  if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) {
    throw WindowsException(hr);
  }
}

Dispatcher createDispatcher(List<String> progIds) {
  Object? lastError;
  for (final progId in progIds) {
    try {
      final progIdPtr = progId.toNativeUtf16();
      final clsid = calloc<GUID>();
      final unknownPtr = calloc<COMObject>();
      final dispatchPtr = calloc<COMObject>();

      try {
        var hr = CLSIDFromProgID(progIdPtr, clsid);
        if (FAILED(hr)) {
          throw WindowsException(hr);
        }

        final iidIUnknown = convertToIID(IID_IUnknown);
        final iidDispatch = convertToIID(IID_IDispatch);
        try {
          hr = _coCreateUnknownWithFallback(clsid, iidIUnknown, unknownPtr);
          if (FAILED(hr)) {
            throw WindowsException(hr);
          }

          final unknown = IUnknown(unknownPtr);
          try {
            hr = unknown.queryInterface(iidDispatch, dispatchPtr.cast());
            if (FAILED(hr)) {
              throw WindowsException(hr);
            }
          } finally {
            unknown.detach();
            unknown.release();
          }
        } finally {
          free(iidIUnknown);
          free(iidDispatch);
        }

        free(unknownPtr);
        return Dispatcher(IDispatch(dispatchPtr));
      } finally {
        free(progIdPtr);
        free(clsid);
      }
    } catch (error) {
      lastError = error;
    }
  }

  throw StateError(
    'Nao foi possivel instanciar nenhum ProgID: ${progIds.join(', ')}. '
    'Ultimo erro: $lastError',
  );
}

int _coCreateUnknownWithFallback(
  Pointer<GUID> clsid,
  Pointer<GUID> iidIUnknown,
  Pointer<COMObject> unknownPtr,
) {
  final contexts = <int>[
    CLSCTX.CLSCTX_LOCAL_SERVER,
    CLSCTX.CLSCTX_ALL,
  ];

  var lastHr = E_NOINTERFACE;
  for (final context in contexts) {
    final hr = CoCreateInstance(
      clsid,
      nullptr,
      context,
      iidIUnknown,
      unknownPtr.cast(),
    );
    if (SUCCEEDED(hr)) {
      return hr;
    }
    lastHr = hr;
  }

  return lastHr;
}

void setProperty(Dispatcher dispatcher, String name, Object? value) {
  final variant = _variantFromValue(value);
  try {
    dispatcher.set(name, variant);
  } finally {
    _disposeVariantPointer(variant);
  }
}

void invokeMethod(Dispatcher dispatcher, String method, [List<Object?> args = const []]) {
  final invocation = _InvocationArgs.fromValues(args);
  try {
    dispatcher.invoke(method, invocation.params);
  } finally {
    invocation.dispose();
  }
}

Dispatcher invokeDispatchMethod(
  Dispatcher dispatcher,
  String method, [
  List<Object?> args = const [],
]) {
  final result = _invokeForResult(dispatcher, method, args);
  try {
    return _dispatchFromVariant(result, method);
  } finally {
    _disposeVariantPointer(result);
  }
}

int invokeIntMethod(Dispatcher dispatcher, String method, [List<Object?> args = const []]) {
  final result = _invokeForResult(dispatcher, method, args);
  try {
    return _intFromVariant(result, method);
  } finally {
    _disposeVariantPointer(result);
  }
}

Dispatcher getDispatchProperty(Dispatcher dispatcher, String name) {
  final result = dispatcher.get(name);
  try {
    return _dispatchFromVariant(result, name);
  } finally {
    _disposeVariantPointer(result);
  }
}

int getIntProperty(Dispatcher dispatcher, String name) {
  final result = dispatcher.get(name);
  try {
    return _intFromVariant(result, name);
  } finally {
    _disposeVariantPointer(result);
  }
}

String getStringProperty(Dispatcher dispatcher, String name) {
  final result = dispatcher.get(name);
  try {
    if (result.ref.vt != VARENUM.VT_BSTR) {
      throw StateError(
        'O retorno de $name nao eh string. VT=${result.ref.vt}',
      );
    }
    return result.ref.bstrVal.toDartString();
  } finally {
    _disposeVariantPointer(result);
  }
}

void releaseDispatcher(Dispatcher? dispatcher) {
  if (dispatcher == null) {
    return;
  }

  try {
    dispatcher.dispose();
  } catch (_) {
  }
}

Set<int> snapshotProcessIdsByExecutable(String executableName) {
  final normalizedName = executableName.toUpperCase();
  final snapshot = _createToolhelp32Snapshot(_th32csSnapProcess, 0);
  if (snapshot == INVALID_HANDLE_VALUE) {
    throw WindowsException(HRESULT_FROM_WIN32(GetLastError()));
  }

  final entry = calloc<ProcessEntry32Ffi>()..ref.dwSize = sizeOf<ProcessEntry32Ffi>();
  final processIds = <int>{};

  try {
    var hasEntry = _process32First(snapshot, entry) != 0;
    while (hasEntry) {
      final exeName = <int>[];
      for (var index = 0; index < _maxPath; index++) {
        final codeUnit = entry.ref.szExeFile[index];
        if (codeUnit == 0) {
          break;
        }
        exeName.add(codeUnit);
      }
      final dartName = String.fromCharCodes(exeName).toUpperCase();
      if (dartName == normalizedName) {
        processIds.add(entry.ref.th32ProcessID);
      }
      hasEntry = _process32Next(snapshot, entry) != 0;
    }
    return processIds;
  } finally {
    free(entry);
    CloseHandle(snapshot);
  }
}

void terminateProcessesByExecutableName(
  String executableName, {
  int timeoutMs = 8000,
  int pollIntervalMs = 250,
  int quietPeriodMs = 1500,
}) {
  final deadline = DateTime.now().add(Duration(milliseconds: timeoutMs));
  DateTime? emptySince;

  while (true) {
    final processIds = snapshotProcessIdsByExecutable(executableName);
    if (processIds.isEmpty) {
      emptySince ??= DateTime.now();
      if (DateTime.now().difference(emptySince).inMilliseconds >= quietPeriodMs) {
        return;
      }
    } else {
      emptySince = null;

      for (final pid in processIds) {
        terminateProcessById(pid);
      }
    }

    if (DateTime.now().isAfter(deadline)) {
      return;
    }

    sleep(Duration(milliseconds: pollIntervalMs));
  }
}

void terminateProcessById(int processId) {
  final desiredAccess = PROCESS_ACCESS_RIGHTS.PROCESS_TERMINATE |
      PROCESS_ACCESS_RIGHTS.PROCESS_QUERY_LIMITED_INFORMATION |
      PROCESS_ACCESS_RIGHTS.PROCESS_SYNCHRONIZE;
  final processHandle = OpenProcess(desiredAccess, FALSE, processId);
  if (processHandle == 0) {
    final error = GetLastError();
    stderr.writeln('OpenProcess falhou para PID $processId. GetLastError=$error');
    return;
  }

  try {
    final waitBefore = WaitForSingleObject(processHandle, 2000);
    if (waitBefore == WAIT_EVENT.WAIT_OBJECT_0) {
      stdout.writeln('PID $processId ja havia encerrado.');
      return;
    }

    final ok = TerminateProcess(processHandle, 0);
    if (ok == 0) {
      final error = GetLastError();
      stderr.writeln('TerminateProcess falhou para PID $processId. GetLastError=$error');
      return;
    }

    final waitAfter = WaitForSingleObject(processHandle, 5000);
    if (waitAfter != WAIT_EVENT.WAIT_OBJECT_0) {
      stderr.writeln(
        'PID $processId nao confirmou encerramento apos kill. wait=$waitAfter',
      );
    } else {
      stdout.writeln('PID $processId encerrado com sucesso.');
    }
  } finally {
    CloseHandle(processHandle);
  }
}

Pointer<VARIANT> _invokeForResult(
  Dispatcher dispatcher,
  String method,
  List<Object?> args,
) {
  final invocation = _InvocationArgs.fromValues(args);
  final result = calloc<VARIANT>();
  VariantInit(result);

  try {
    dispatcher.invoke(method, invocation.params, result);
    return result;
  } catch (_) {
    _disposeVariantPointer(result);
    rethrow;
  } finally {
    invocation.dispose();
  }
}

Dispatcher _dispatchFromVariant(Pointer<VARIANT> variant, String memberName) {
  final vt = variant.ref.vt;
  if (vt != VARENUM.VT_DISPATCH) {
    throw StateError(
      'O retorno de $memberName nao eh um IDispatch. VT=$vt',
    );
  }

  final dispatch = variant.ref.pdispVal;
  dispatch.addRef();
  return Dispatcher(dispatch);
}

int _intFromVariant(Pointer<VARIANT> variant, String memberName) {
  switch (variant.ref.vt) {
    case VARENUM.VT_I2:
      return variant.ref.iVal;
    case VARENUM.VT_I4:
      return variant.ref.lVal;
    case VARENUM.VT_UI2:
      return variant.ref.uiVal;
    case VARENUM.VT_UI4:
      return variant.ref.ulVal;
    default:
      throw StateError(
        'O retorno de $memberName nao eh inteiro. VT=${variant.ref.vt}',
      );
  }
}

Pointer<VARIANT> _variantFromValue(Object? value) {
  final variant = calloc<VARIANT>();
  VariantInit(variant);
  _writeVariantValue(variant, value);
  return variant;
}

void _writeVariantValue(Pointer<VARIANT> variant, Object? value) {
  if (value == null) {
    variant.ref.vt = VARENUM.VT_EMPTY;
    return;
  }

  if (value is String) {
    final bstr = BSTR.fromString(value);
    variant.ref
      ..vt = VARENUM.VT_BSTR
      ..bstrVal = bstr.ptr;
    return;
  }

  if (value is bool) {
    variant.ref
      ..vt = VARENUM.VT_BOOL
      ..boolVal = value;
    return;
  }

  if (value is int) {
    variant.ref
      ..vt = VARENUM.VT_I4
      ..lVal = value;
    return;
  }

  if (value is Dispatcher) {
    value.dispatch.addRef();
    variant.ref
      ..vt = VARENUM.VT_DISPATCH
      ..pdispVal = value.dispatch;
    return;
  }

  throw ArgumentError('Tipo de argumento COM nao suportado: ${value.runtimeType}');
}

void _disposeVariantPointer(Pointer<VARIANT> variant) {
  VariantClear(variant);
  free(variant);
}

final class _InvocationArgs {
  _InvocationArgs._(this.params, this.variants, this.namedArg);

  final Pointer<DISPPARAMS> params;
  final Pointer<VARIANT> variants;
  final Pointer<Int32> namedArg;

  factory _InvocationArgs.fromValues(List<Object?> values) {
    final params = calloc<DISPPARAMS>();
    if (values.isEmpty) {
      params.ref
        ..rgvarg = nullptr
        ..rgdispidNamedArgs = nullptr
        ..cArgs = 0
        ..cNamedArgs = 0;
      return _InvocationArgs._(params, nullptr, nullptr);
    }

    final variants = calloc<VARIANT>(values.length);
    for (var index = 0; index < values.length; index++) {
      final reversedIndex = values.length - 1 - index;
      final variant = variants + index;
      VariantInit(variant);
      _writeVariantValue(variant, values[reversedIndex]);
    }

    params.ref
      ..rgvarg = variants
      ..rgdispidNamedArgs = nullptr
      ..cArgs = values.length
      ..cNamedArgs = 0;

    return _InvocationArgs._(params, variants, nullptr);
  }

  void dispose() {
    if (variants != nullptr) {
      for (var index = 0; index < params.ref.cArgs; index++) {
        VariantClear(variants + index);
      }
      free(variants);
    }
    if (namedArg != nullptr) {
      free(namedArg);
    }
    free(params);
  }
}