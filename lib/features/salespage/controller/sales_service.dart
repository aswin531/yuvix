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

  void saveSales ({
    required String date,
    required String customerName,
    required String mobileNumber,
    required double totalAmount,
    required List<SalesItemModel> salesList,
  })async {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${salesList}");
    for (var element in salesList) {
      print("(((((((((((((((((${element.pricePerUnit})))))))))))))))))");
      
    }
    final salesData = SalesModel(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      totalAmount: totalAmount,
      salesList: salesList.toList(),
    );

    _salesBox.add(salesData);
 

    
    notifyListeners();
  }

  List<SalesModel> getAllSales() {
    List<SalesModel> allSales = _salesBox.values.toList();

 for (var sale in allSales) {
      print('Date: ${sale.date}');
      print('Customer Name: ${sale.customerName}');
      print('Mobile Number: ${sale.mobileNumber}');
      print('Total Amount: ${sale.totalAmount}');
      print('Sales List:');
      for (var item in sale.salesList) {
        print('  - Product Name: ${item.productName}');
        print('  - Quantity: ${item.quantity}');
        print('  - Price per Unit: ${item.pricePerUnit}');
        print('  - Total Price: ${item.totalPrice}');
      }
      print('----------------------------------------');
    }

    return allSales;
  }
}
