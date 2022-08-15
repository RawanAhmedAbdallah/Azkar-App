enum ZekrTableKey{
  zekrId, content,count, categoryId
}
class Zekr {
  late int zekrId;
  late String content;
  late int count;
  late int categoryId;


  static const tableName = 'azkar';

  Zekr();

  Zekr.fromMap(Map<String, dynamic> rowMap) {
    zekrId = rowMap[ZekrTableKey.zekrId.name];
    content = rowMap[ZekrTableKey.content.name];
    count = rowMap[ZekrTableKey.count.name];
    categoryId = rowMap[ZekrTableKey.categoryId.name];
  }
    Map<String, dynamic> toMap() {
      Map<String, dynamic> map = <String, dynamic>{};
      map[ZekrTableKey.content.name] = content;
      map[ZekrTableKey.count.name] = count;
      map[ZekrTableKey.categoryId.name] = categoryId;
      return map;
    }
  }