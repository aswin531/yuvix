
import 'package:flutter/material.dart';

class SalesCardDetails extends StatelessWidget {
    // final Map<String, dynamic> sales;
  final sales;

  const SalesCardDetails({required this.sales});

  @override
  Widget build(BuildContext context) {
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
                    'Customer Name: ${sales['customerName']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Mobile Number: ${sales['mobileNumber']}'),
                  SizedBox(height: 5),
                  Text('Date: ${sales['date']}'),
                  SizedBox(height: 5),
                  Text('Total Amount: ₹${sales['totalAmount']}'),
                  SizedBox(height: 5),
                  Text('Sales List:'),
                  ...sales['salesList'].map<Widget>((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        '- ${item['productName']} (₹${item['price']} x ${item['quantity']})',
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        );
  
  }
}
