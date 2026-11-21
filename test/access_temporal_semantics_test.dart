import 'package:access_to_dart/src/access_temporal_semantics.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:test/test.dart';

void main() {
  test('mantem date-only de apresentacao separado do timestamp fisico', () {
    final column = AnalysisColumn(
      name: 'DPP',
      typeName: 'DateTime',
      typeCode: 8,
      isAutoNumber: false,
      isCalculated: false,
      isRequired: false,
      caption: null,
      defaultValue: null,
      maxLength: null,
      calculatedExpression: null,
      validationRule: null,
      validationText: null,
      description: null,
      decimalPlaces: null,
      displayControl: null,
      textFormat: null,
      imeMode: null,
      imeSentenceMode: null,
      resultType: null,
      propertyGuid: null,
      allowMultipleValues: null,
      rowSourceType: null,
      rowSource: null,
      wssFieldId: null,
      formatString: null,
      inputMask: null,
      allowZeroLength: null,
      precision: null,
      scale: null,
    );

    final semantic = inferAccessTemporalSemanticWithRows(
      column,
      rows: const [
        {'DPP': '2021-08-02T00:00:00.000Z'},
        {'DPP': '2021-05-24T00:00:00.000Z'},
      ],
    );

    expect(semantic, AccessTemporalSemantic.dateOnly);
    expect(
      postgresTemporalTypeForColumn(
        column,
        rows: const [
          {'DPP': '2021-08-02T00:00:00.000Z'},
        ],
      ),
      'TIMESTAMP',
    );
    expect(
      formatTemporalValueForSql(
        DateTime.utc(2021, 8, 2, 13, 45, 12),
        column,
        rows: const [
          {'DPP': '2021-08-02T00:00:00.000Z'},
        ],
      ),
      '2021-08-02T13:45:12.000Z',
    );
  });
  test(
      'display Short Time stays independent from physical DateTime and precision',
      () {
    final column = AnalysisColumn.fromJson({
      'name': 'Horario',
      'typeName': 'DateTime',
      'format': 'Short Time',
      'defaultValue': 'Time()'
    });
    final value = DateTime.utc(2024, 3, 4, 5, 6, 7, 123, 456);
    expect(
        inferAccessTemporalSemantic(column), AccessTemporalSemantic.timeOnly);
    expect(inferAccessTemporalStorageSemantic(column),
        AccessTemporalSemantic.timestamp);
    expect(postgresTemporalTypeForColumn(column), 'TIMESTAMP');
    expect(formatTemporalValueForSql(value, column),
        '2024-03-04T05:06:07.123456Z');
    expect(formatTemporalValueForFrontend(value, 'time'), '05:06:07');
  });
  test(
      'explicit Date and Time storage retain their declared type and time micros',
      () {
    final date = AnalysisColumn.fromJson({'name': 'Dia', 'typeName': 'Date'});
    final time = AnalysisColumn.fromJson({'name': 'Hora', 'typeName': 'Time'});
    final local = DateTime(2020, 2, 3, 4, 5, 6, 7, 8);
    expect(postgresTemporalTypeForColumn(date), 'DATE');
    expect(postgresTemporalTypeForColumn(time), 'TIME');
    expect(formatTemporalValueForSql(local, date), '2020-02-03');
    expect(formatTemporalValueForSql(local, time), '04:05:06.007008');
    expect(accessCivilComponentsAsUtc(local),
        DateTime.utc(2020, 2, 3, 4, 5, 6, 7, 8));
  });
}
