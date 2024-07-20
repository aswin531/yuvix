import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/productmodel.dart';

class ProductService with ChangeNotifier {
  Box<ProductModel>? _productBox;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  ProductService() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _productBox = await Hive.openBox<ProductModel>('products');
    _products = _productBox?.values.toList() ?? [];
    notifyListeners();
  }

  Future<List<ProductModel>> getProducts() async {
    if (_productBox == null) {
      await _initializeBox();
    }
    return _productBox?.values.toList() ?? [];
  }

  // void addProduct(
  //     String imageUrl,
  //     String name,
  //     String color,
  //     int productId,
  //     String brand,
  //     String ram,
  //     String processor,
  //     String battery,
  //     String storage,
  //     String displaySize,
  //     String networkConnectivity,
  //     String compatibility,
  //     String camera,
  //     String material,
  //     String features,
  //     int quantity,
  //     double price,
  //     String productName,
  //     String category) {
  //   _productBox!.add(ProductModel(
  //       productId: productId,
  //       productName: productName,
  //       category: category,
  //       brand: brand,
  //       quantity: quantity,
  //       price: price));
  //       notifyListeners();
  // }

  Future<void> addProduct(ProductModel product) async {
    if (_productBox == null) return;
    await _productBox!.put(product.productId, product);
    _products = _productBox!.values.toList();
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
