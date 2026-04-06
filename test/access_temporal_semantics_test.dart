import 'package:access_to_dart/src/access_temporal_semantics.dart';
import 'package:access_to_dart/src/analysis_model.dart';
import 'package:test/test.dart';

void main() {
  test('infere date-only por observacao de rows mesmo sem format ou mask', () {
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
      'DATE',
    );
    expect(
      formatTemporalValueForSql(
        DateTime.utc(2021, 8, 2, 13, 45, 12),
        column,
        rows: const [
          {'DPP': '2021-08-02T00:00:00.000Z'},
        ],
      ),
      '2021-08-02',
    );
  });
}