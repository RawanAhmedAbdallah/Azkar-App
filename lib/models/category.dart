enum CategoryTableKey{
  id, title
}
class Category {
  late int id;
  late String title;

  static const tableName = 'categories';

  Category();

  Category.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap[CategoryTableKey.id.name];
    title = rowMap[CategoryTableKey.title.name];
  }

    Map<String, dynamic> toMap() {
      Map<String, dynamic> map = <String, dynamic>{};
      map[CategoryTableKey.title.name] = title;
      return map;
    }
  }

