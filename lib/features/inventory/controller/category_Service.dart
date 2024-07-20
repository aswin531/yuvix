import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:yuvix/features/inventory/models/categorymodel.dart';
import 'package:yuvix/main.dart';

class CategoryService extends ChangeNotifier {

  Future<void> addCategory(CategoryModel category, String imagePath) async {
    category.image = imagePath; 
    await catBox.add(category);
    notifyListeners(); 
  }

  Future<List<CategoryModel>> getCategories() async {
    
    return catBox.values.toList(); 
  }
}
