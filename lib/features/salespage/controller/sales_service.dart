
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SalesProvider with ChangeNotifier {
  late Box _salesBox;

  SalesProvider() {
    initializeSalesBox();
  }

  Future<void> initializeSalesBox() async {
    _salesBox = await Hive.openBox('sales');
    notifyListeners();
  }

  void saveSales({
    required String date,
    required String customerName,
    required String mobileNumber,
    required double totalAmount,
    required List<Map<String, dynamic>> salesList,
  }) {
    final salesData = {
      'date': date,
      'customerName': customerName,
      'mobileNumber': mobileNumber,
      'totalAmount': totalAmount,
      'salesList': salesList,
    };

    _salesBox.add(salesData);
    notifyListeners();
  }

  List getAllSales() {
    return _salesBox.values.toList();
  }}
//     List<Map<String, dynamic>> getAllSales() {
//     return _salesBox.values.cast<Map<String, dynamic>>().toList();
//   }
// }



