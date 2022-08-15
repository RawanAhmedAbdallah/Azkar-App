import 'package:azkar_app/database/db_operations.dart';
import 'package:azkar_app/models/category.dart';
import 'package:sqflite/sqlite_api.dart';

import '../db_controller.dart';


class CategoryDbController implements DbOperations<Category> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Category model) async{
    // int newRowId = await _database.rawInsert(
    //     'INSERT INTO notes (title, info, user_id) VALUES (?, ?, ?)',
    //     [model.title, model.info, model.userId]);
    return _database.insert(Category.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    // int countOfDeletedRows = await _database.rawDelete('DELETE FROM notes WHERE id = ?',[id]);
    int countOfDeletedRows = await _database
        .delete(Category.tableName, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Category>> read() async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes');

  //  int userId =
  //      SharedPrefController().getValueFor<int>(key: PrefKeys.id.name) ?? -1;
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Category.tableName);
    return rowsMap.map((rowMap) => Category.fromMap(rowMap)).toList();
  }

  @override
  Future<Category?> show(int id) async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes WHERE id = ?', [id]);
    List<Map<String, dynamic>> rowsMap =
    await _database.query(Category.tableName, where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Category.fromMap(rowsMap.first) : null;
  }

  @override
  Future<bool> update(Category model) async {
    // int countOfUpdatedRows = await _database.rawUpdate(
    //     'UPDATE notes SET title = ?, info = ? WHERE id = ?',
    //     [model.title, model.info, model.id]);
    int countOfUpdatedRows = await _database.update(
        Category.tableName, model.toMap(),
        where: 'id = ?', whereArgs: [model.id]);
    return countOfUpdatedRows > 0;
  }

  Future<int> getCategoriesCount() async {
    var rowsMap =
    await _database.query(Category.tableName);
    // int? count = Sqflite.firstIntValue(rowsMap);
    int count = rowsMap.length;
    return count;
  }
}