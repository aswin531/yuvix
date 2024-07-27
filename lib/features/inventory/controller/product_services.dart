import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/product_model.dart';



class ProductService with ChangeNotifier {
  Box<ProductModel>? _productBox;

  List<ProductModel> _products = [];
  List<ProductModel> productsMy = [];
  List<ProductModel> get products => _products;

  ProductService() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _productBox = await Hive.openBox<ProductModel>('products');
    _products = _productBox?.values.toList() ?? [];
    notifyListeners();
  }

  getProducts() async {
    final productBox = await Hive.openBox<ProductModel>('products');
    // log(productBox.values.toList().length.toString());
    productsMy = productBox.values.toList();
    // log('enetred get products fn');
    // log(productsMy.length.toString());
    notifyListeners();
  }

  Future<void> addProduct(ProductModel product) async {
    if (_productBox == null) return;
    await _productBox!.add(product);
    _products = _productBox!.values.toList();
    log(_products.length.toString());
    notifyListeners();
  }
  
  Future<void> deleteProduct(int productId) async {
    if (_productBox == null) return;
    final productKey = _productBox!.keys.firstWhere(
      (key) => _productBox!.get(key)!.productId == productId,
      orElse: () => null,
    );

    if (productKey != null) {
      await _productBox!.delete(productKey);
      _products = _productBox!.values.toList();
      notifyListeners();
    } else {
      log('Product not found');
    }
  notifyListeners();
  }
 

  // Future<void> updateProduct(ProductModel product) async {
  //   if (_productBox == null) return;
  //   await _productBox!.put(product.productId, product);
  //   _products = _productBox!.values.toList();
  //   notifyListeners();
  // }
 Future<void> updateProduct(ProductModel product) async {
  if (_productBox == null) return;

    final productBox = await Hive.openBox<ProductModel>('products');
   final index = productBox.values.toList().indexWhere((value) => value.productId == product.productId);
   final fetchedProduct=productBox.getAt(index);
   log('this is index>>>>>>>>>>>>>>${index}');
   log('this is product id${product.productId}');
   log('this is fetched product>>>>${fetchedProduct!.productName}');
   productBox.putAt(index, product);
     
  // _products = _productBox!.values.toList();
  notifyListeners();
}


 
}


