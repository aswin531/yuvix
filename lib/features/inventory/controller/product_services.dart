import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product_model.dart';

class ProductService with ChangeNotifier {
  Box<ProductModel>? _productBox;

  List<ProductModel> _products = [];
  List<ProductModel> productsMy = [];
  List<ProductModel> _searchResults = [];
  List<ProductModel> get products => _products;
  List<ProductModel> get searchResults => _searchResults; 

  ProductService() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _productBox = await Hive.openBox<ProductModel>('products');
    _products = _productBox?.values.toList() ?? [];
    notifyListeners();
  }

  Future<void> getProducts() async {
    final productBox = await Hive.openBox<ProductModel>('products');
    productsMy = productBox.values.toList();
    notifyListeners();
  }

  Future<void> addProduct(ProductModel product) async {
    if (_productBox == null) return;
    await _productBox!.add(product);
    _products = _productBox!.values.toList();
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
  }

  Future<void> updateProduct(ProductModel product) async {
    if (_productBox == null) return;
    final productBox = await Hive.openBox<ProductModel>('products');
    final index = productBox.values.toList().indexWhere((value) => value.productId == product.productId);
    if (index != -1) {
      productBox.putAt(index, product);
      _products = productBox.values.toList();
      notifyListeners();
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _products
          .where((product) => product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
    