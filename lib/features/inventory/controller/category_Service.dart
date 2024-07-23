import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

import 'package:yuvix/main.dart';

import '../models/category_model.dart';

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
