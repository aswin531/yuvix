
import 'dart:io';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String color;
  final String price;

  const ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.color,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.file(File(imageUrl),
                  fit: BoxFit.cover, width: double.infinity, height: 100),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(color),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    SizedBox(width: 4.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
