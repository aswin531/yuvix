import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/product_model.dart';
// import 'package:provider/provider.dart';


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
    // if (_productBox == null) {
    //   await _initializeBox();
    // }
    final productBox = await Hive.openBox<ProductModel>('products');
    log(productBox.values.toList().length.toString());
    productsMy = productBox.values.toList();
    log('enetred get products fn');
    log(productsMy.length.toString());
  }

  Future<void> addProduct(ProductModel product) async {
    if (_productBox == null) return;
    await _productBox!.add(product);
    _products = _productBox!.values.toList();
    log(_products.length.toString());
    notifyListeners();
  }

  Future<void> deleteProduct(String productId) async {
    if (_productBox == null) return;
    await _productBox!.delete(productId);
    _products = _productBox!.values.toList();
    notifyListeners();
  }

  Future<void> updateProduct(ProductModel product) async {
    if (_productBox == null) return;
    await _productBox!.put(product.productId, product);
    _products = _productBox!.values.toList();
    notifyListeners();
  }
}

