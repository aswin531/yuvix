import 'package:flutter/material.dart';

import 'dart:io';

import 'package:provider/provider.dart';
import '../../controller/product_services.dart';

class BrandDetailPage extends StatelessWidget {
  final String brand;

  BrandDetailPage({required this.brand});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    productService.getProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03448c),
        title: Text('${brand} Products'),
      ),
      body: Consumer<ProductService>(builder: (context, value, child) {
        var filteredProducts = value.productsMy.where((element) => element.brand == brand).toList();

        return GridView.builder(
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];

            return ProductCard(
              imageUrl: product.image ?? 'https://via.placeholder.com/150',
              productName: product.productName,
              color: product.color ?? 'Unknown Color',
              price: '₹${product.price.toStringAsFixed(2)}',
            );
          },
        );
      }),
    );
  }
}

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
