
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yuvix/features/salespage/model/sales_item_model.dart';
import 'package:yuvix/features/salespage/model/sales_model.dart';

class SalesProvider with ChangeNotifier {
  late Box<SalesModel> _salesBox;

  SalesProvider() {
    initializeSalesBox();
  }

  Future<void> initializeSalesBox() async {
    _salesBox = await Hive.openBox<SalesModel>('sales');
    notifyListeners();
  }

  void saveSales({
    required String date,
    required String customerName,
    required String mobileNumber,
    required double totalAmount,
    required List<SalesItemModel> salesList,
  }) async {
    final salesData = SalesModel(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      totalAmount: totalAmount,
      // categoryselect: '',
      salesList: salesList.toList(), 
    );

    _salesBox.add(salesData);
    notifyListeners();
  }

  List<SalesModel> getAllSales() {
    return _salesBox.values.toList();
  }

  List<SalesModel> getFilteredSales(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return [];
    }
    return _salesBox.values.where((sale) {
      DateTime saleDate = DateTime.parse(sale.date);
      return saleDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          saleDate.isBefore(endDate.add(Duration(days: 1)));
    }).toList();
  }

  int getTotalQuantity(List<SalesModel> sales) {
    int totalQuantity = 0;
    for (var sale in sales) {
      totalQuantity += sale.salesList.length;
    }
    return totalQuantity;
  }

  double getTotalAmount(List<SalesModel> sales) {
    double totalAmount = 0;
    for (var sale in sales) {
      totalAmount += sale.totalAmount;
    }
    return totalAmount;
  }
}
