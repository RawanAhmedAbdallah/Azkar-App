import 'package:azkar_app/database/db_controller.dart';
import 'package:azkar_app/database/db_operations.dart';
import 'package:azkar_app/models/zekr.dart';
import 'package:sqflite/sqlite_api.dart';


class ZekrDbController implements DbOperations<Zekr> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Zekr model) async {
    // int newRowId = await _database.rawInsert(
    //     'INSERT INTO notes (title, info, user_id) VALUES (?, ?, ?)',
    //     [model.title, model.info, model.userId]);
    return _database.insert(Zekr.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    // int countOfDeletedRows = await _database.rawDelete('DELETE FROM notes WHERE id = ?',[id]);
    int countOfDeletedRows = await _database
        .delete(Zekr.tableName, where: 'categoryId = ?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Zekr>> read() async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes');

    //  int userId =
    //      SharedPrefController().getValueFor<int>(key: PrefKeys.id.name) ?? -1;
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Zekr.tableName);
    return rowsMap.map((rowMap) => Zekr.fromMap(rowMap)).toList();
  }

  @override
  Future<Zekr?> show(int id) async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes WHERE id = ?', [id]);
    List<Map<String, dynamic>> rowsMap =
    await _database.query(Zekr.tableName, where: 'categoryId = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Zekr.fromMap(rowsMap.first) : null;
  }

  @override
  Future<bool> update(Zekr model) async {
  // int countOfUpdatedRows = await _database.rawUpdate(
  //     'UPDATE notes SET title = ?, info = ? WHERE id = ?',
  //     [model.title, model.info, model.id]);
  int countOfUpdatedRows = await _database.update(
      Zekr.tableName, model.toMap(),
      where: 'categoryId = ?', whereArgs: [model.categoryId]);
  return countOfUpdatedRows > 0;
}

  Future<List<Zekr>> readZekrCategoryId (int categoryId) async {
    List<Map<String, dynamic>> rowsMap =
    await _database.query(Zekr.tableName, where: 'categoryId = ?', whereArgs: [categoryId]);
    return rowsMap.map((rowMap) => Zekr.fromMap(rowMap)).toList();
  }
  Future<int> getAzkarCount() async {
    var rowsMap =
    await _database.query(Zekr.tableName);
    // int? count = Sqflite.firstIntValue(rowsMap);
    int count = rowsMap.length;
    return count;
  }
}