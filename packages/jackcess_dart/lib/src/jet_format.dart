class JetFormat {
  final String name;
  final int versionByte;
  final int pageSize;
  final int offsetNextTableDefPage;
  final int offsetNumRows;
  final int offsetTableType;

  const JetFormat({
    required this.name,
    required this.versionByte,
    required this.pageSize,
    required this.offsetNextTableDefPage,
    required this.offsetNumRows,
    required this.offsetTableType,
  });

  static const JetFormat version3 = JetFormat(
    name: 'VERSION_3',
    versionByte: 0x00,
    pageSize: 2048,
    offsetNextTableDefPage: 4,
    offsetNumRows: 12,
    offsetTableType: 20,
  );
  static const JetFormat version4 = JetFormat(
    name: 'VERSION_4',
    versionByte: 0x01,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );
  static const JetFormat msIsam = JetFormat(
    name: 'VERSION_MSISAM',
    versionByte: 0x01,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );
  static const JetFormat version12 = JetFormat(
    name: 'VERSION_12',
    versionByte: 0x02,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );
  static const JetFormat version14 = JetFormat(
    name: 'VERSION_14',
    versionByte: 0x03,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );
  static const JetFormat version16 = JetFormat(
    name: 'VERSION_16',
    versionByte: 0x05,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );
  static const JetFormat version17 = JetFormat(
    name: 'VERSION_17',
    versionByte: 0x06,
    pageSize: 4096,
    offsetNextTableDefPage: 4,
    offsetNumRows: 16,
    offsetTableType: 40,
  );

  static JetFormat getFormat(int versionByte) {
    switch (versionByte) {
      case 0x00:
        return version3;
      case 0x01:
        // Could be MSISAM or version 4, simplified here
        return version4;
      case 0x02:
        return version12;
      case 0x03:
        return version14;
      case 0x05:
        return version16;
      case 0x06:
        return version17;
      default:
        throw Exception("Unsupported version: $versionByte");
    }
  }

  Map<String, Object> toJson() => <String, Object>{
        'name': name,
        'versionByte': versionByte,
        'pageSize': pageSize,
        'offsetNextTableDefPage': offsetNextTableDefPage,
        'offsetNumRows': offsetNumRows,
        'offsetTableType': offsetTableType,
      };

  @override
  String toString() => name;
}
