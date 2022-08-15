import 'package:flutter/material.dart';
import '../database/controller/category_db_controller.dart';
import '../models/category.dart';
import '../models/process_response.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = <Category>[];

  CategoryDbController _dbController = CategoryDbController();

  Future<ProcessResponse> create({required Category category}) async {
    int newRowId = await _dbController.create(category);
    if (newRowId != 0) {
      category.id = newRowId;
      categories.add(category);
      notifyListeners();
    }
    return ProcessResponse(
      message: newRowId != 0 ? 'Created successfully' : 'Create failed!',
      success: newRowId != 0,
    );
  }

  void read() async {
    categories = await _dbController.read();
    notifyListeners();
  }

  Future<ProcessResponse> update({required Category updatedNote}) async {
    bool updated = await _dbController.update(updatedNote);
    if (updated) {
      int index = categories.indexWhere((element) => element.id == updatedNote.id);
      if (index != -1) {
        categories[index] = updatedNote;
        notifyListeners();
      }
    }
    return ProcessResponse(
        message: updated ? 'Updated successfully' : 'Update failed!',
        success: updated);
  }

  Future<ProcessResponse> delete({required int index}) async {
    bool deleted = await _dbController.delete(categories[index].id);
    if (deleted) {
      categories.removeAt(index);
      notifyListeners();
    }
    return ProcessResponse(
        message: deleted ? 'Deleted successfully' : 'Delete failed!',
        success: deleted);
  }

  Future<void> createCategories() async{
    int count = await _dbController.getCategoriesCount();
    if (count == 0){
      await create(category: setCategory('أذكار الصباح'));
      await create(category: setCategory('أذكار المساء'));
      await create(category: setCategory('أذكار بعد الصلاة'));
      }
   }

  Category setCategory(String title) {
    Category category = Category();
    category.title = title;
    return category;
   }
 }