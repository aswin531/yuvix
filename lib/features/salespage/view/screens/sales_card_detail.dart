
import 'package:flutter/material.dart';
import 'package:yuvix/features/salespage/model/sales_model.dart';

class SalesCardDetails extends StatelessWidget {
    // final Map<String, dynamic> sales;
  final SalesModel sales;

  const SalesCardDetails({required this.sales});

  @override
  Widget build(BuildContext context) {
   // print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${sales.values}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Details'),
      ),
      body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Name: ${sales.customerName}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Mobile Number: ${sales.mobileNumber}'),
                  SizedBox(height: 5),
                  Text('Date: ${sales.date}'),
                  SizedBox(height: 5),
                  Text('Total Amount: ₹${sales.totalAmount}'),
                  SizedBox(height: 5),
                  Text('Sales List:'),
                  ...sales.salesList.map<Widget>((item) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            '- ${item.productName} (₹${item.pricePerUnit} x ${item.quantity})',
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        );
  
  }
}
