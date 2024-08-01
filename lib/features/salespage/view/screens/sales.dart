import 'package:flutter/material.dart';


import '../widget/sale_card.dart';
import 'sale_more.dart';
import 'sales_add_sheet.dart';

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
            child: ListView(
              children: [
                SalesCard(
                    buyerName: 'Buyer 1',
                    productName: 'Product 1',
                    price: '₹1000',
                    date: '2024-07-01'),
                SalesCard(
                    buyerName: 'Buyer 2',
                    productName: 'Product 2',
                    price: '₹2000',
                    date: '2024-07-02'),
                SalesCard(
                    buyerName: 'Buyer 3',
                    productName: 'Product 3',
                    price: '₹4000',
                    date: '2024-07-02'),
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
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
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
