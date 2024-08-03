import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yuvix/features/salespage/model/sales_model.dart';

class SalesProvider with ChangeNotifier {
  final Box<SalesModel> _salesBox = Hive.box<SalesModel>('salesBox');

  List<SalesModel> _sales = [];

  SalesProvider() {
    _loadSales();
  }

  List<SalesModel> get sales => _sales;

  void _loadSales() {
    _sales = _salesBox.values.toList();
    notifyListeners();
  }

  void saveSales({
    required String date,
    required String customerName,
    required String mobileNumber,
    required String productName,
    required int quantity,
    required double pricePerUnit,
  }) {
    final sale = SalesModel(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      productName: productName,
      quantity: quantity,
      pricePerUnit: pricePerUnit,
      totalPrice: quantity * pricePerUnit,
    );

    _salesBox.add(sale);
    _sales.add(sale);

    notifyListeners();
  }

  List<SalesModel> getSales() {
    return _sales;
  }

  void clearSales() {
    _salesBox.clear();
    _sales.clear();
    notifyListeners();
  }
}
