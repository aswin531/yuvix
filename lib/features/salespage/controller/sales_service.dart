import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/sales_model.dart';

class SalesProvider with ChangeNotifier {
  final Box<SalesModel> _salesBox = Hive.box<SalesModel>('salesBox');

  void saveSales({
    required String date,
    required String customerName,
    required String mobileNumber,
    required String productName,
    required int quantity,
    required double pricePerUnit,
  }) async {
    final totalPrice = quantity * pricePerUnit;

    final salesModel = SalesModel(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      productName: productName,
      quantity: quantity,
      pricePerUnit: pricePerUnit,
      totalPrice: totalPrice,
    );

    await _salesBox.add(salesModel);

    notifyListeners();
  }

  List<SalesModel> getSales() {
    return _salesBox.values.toList();
  }
}
