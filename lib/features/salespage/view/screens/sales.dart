
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:yuvix/features/salespage/controller/sales_service.dart'; 
import 'package:yuvix/features/salespage/view/screens/sales_add_sheet.dart';
import '../widget/sale_card.dart';
import 'sale_more.dart';

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Recent Sales',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<SalesProvider>(
              builder: (context, salesProvider, child) {
                final allSales = salesProvider.getAllSales();
                if (allSales.isEmpty) {
                  return Center(child: Text('No sales recorded.'));
                }

                DateTime today = DateTime.now();
                String formattedToday = DateFormat('yyyy-MM-dd').format(today);

                final todaySales = allSales.where((sale) {
                  return sale['date'] == formattedToday;
                }).toList();

                final otherSales = allSales.where((sale) {
                  return sale['date'] != formattedToday;
                }).toList();

                final limitedSales = [...todaySales, ...otherSales.take(4)].toList();

                return ListView.builder(
                  itemCount: limitedSales.length,
                  itemBuilder: (context, index) {
                    final sale = limitedSales[index];
                    final salesList = sale['salesList'] as List<dynamic>;

                    Map<String, int> productQuantities = {};
                    double totalAmount = sale['totalAmount'];

                    salesList.forEach((product) {
                      final productName = product['productName'];
                      final productQuantity = product['quantity'] as int;

                      if (productQuantities.containsKey(productName)) {
                        productQuantities[productName] = productQuantities[productName]! + productQuantity;
                      } else {
                        productQuantities[productName] = productQuantity;
                      }
                    });

                    return SalesCard(
                      buyerName: sale['customerName'],
                      mobileNumber: sale['mobileNumber'],
                      totalAmount: totalAmount,
                      productQuantities: productQuantities,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalesMore(),
                  ),
                );
              },
              child: Text(
                'See More',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalesAddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
