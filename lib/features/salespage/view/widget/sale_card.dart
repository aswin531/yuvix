

import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  final String buyerName;
  final String mobileNumber;
  final double totalAmount;
  final Map<String, int> productQuantities;

  const SalesCard({
    Key? key,
    required this.buyerName,
    required this.mobileNumber,
    required this.totalAmount,
    required this.productQuantities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(buyerName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile: $mobileNumber'),
            Text('Total Amount: ₹$totalAmount'),
            Text('Products: ${productQuantities.toString()}'),
          ],
        ),
      ),
    );
  }
}
