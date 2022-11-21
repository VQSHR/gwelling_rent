// 结果数据类型
class FilterBarResult {
  final String? areaId; // 区域
  final String? priceId; // 租金
  final String? rentTypeId; // 方式
  final List<String>? moreIds; // 筛选

  FilterBarResult(
      {this.areaId,
      this.priceId,
      this.rentTypeId,
      this.moreIds,
      String? priceTypeId,
      List<String>? moreId});
}

// 通用类型
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('Area1', '11'),
  GeneralType('Area2', '22'),
];
List<GeneralType> priceList = [
  GeneralType('Price1', '22'),
  GeneralType('Price2', 'aa'),
];
List<GeneralType> rentTypeList = [
  GeneralType('rentType1', 'bb'),
  GeneralType('rentType2', '22'),
];
List<GeneralType> roomTypeList = [
  GeneralType('roomType1', '11'),
  GeneralType('roomType2', '22'),
];
List<GeneralType> orientedList = [
  GeneralType('Facing1', '99'),
  GeneralType('Facing2', 'cc'),
];
List<GeneralType> floorList = [
  GeneralType('Floor1', 'aa'),
  GeneralType('Floor2', 'bb'),
];
