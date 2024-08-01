import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  final String buyerName;
  final String productName;
  final String price;
  final String date;

  SalesCard({
    required this.buyerName,
    required this.productName,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            buyerName[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          buyerName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(productName),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              price,
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
