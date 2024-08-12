// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../../../models/product_model.dart';
// import '../mobiles/product_detail_row.dart';


// class OtherDetails extends StatelessWidget {
//   final ProductModel product;

//   OtherDetails({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Center(
//           child: Image.file(
//             File(product.image ?? 'https://via.placeholder.com/150'),
//             height: 200,
//             width: 200,
//           ),
//         ),
//         SizedBox(height: 16.0),
//         ProductDetailRow(label: 'Product Name', value: product.productName),
//         ProductDetailRow(label: 'Category', value: product.category),
//         ProductDetailRow(label: 'Brand', value: product.brand),
//         ProductDetailRow(label: 'RAM', value: '${product.ram} GB'),
//         ProductDetailRow(label: 'Processor', value: '${product.processor}'),
//         ProductDetailRow(label: 'Camera', value: '${product.camera}'),
//         ProductDetailRow(label: 'Battery', value: '${product.battery} mAh'),
//         ProductDetailRow(label: 'Storage', value: '${product.storage} GB'),
//         ProductDetailRow(label: 'Network Connectivity', value:'${product.networkConnectivity}'),
//         ProductDetailRow(label: 'Color', value: product.color ?? 'Unknown Color'),
//         ProductDetailRow(label: 'Display Size', value:'${product.displaySize}'),
//         ProductDetailRow(label: 'Camera', value: '${product.material}'),
//         ProductDetailRow(label: 'Battery', value: '${product.features} mAh'),
//         ProductDetailRow(label: 'Color', value: product.color ?? 'Unknown Color'),
//         ProductDetailRow(label: 'Price', value: '₹${product.price.toStringAsFixed(2)}'),
//         ProductDetailRow(label: 'Quantity', value: '${product.quantity}'),
//         ProductDetailRow(label: 'Price', value: '₹${product.price.toStringAsFixed(2)}'),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../mobiles/product_detail_row.dart';

class OtherDetails extends StatelessWidget {
  final ProductModel product;

  OtherDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: product.image != null 
                      ? Image.file(
                          File(product.image!),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://via.placeholder.com/150',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            _buildProductDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailRow(label: 'Product Name', value: product.productName),
          
            ProductDetailRow(label: 'Category', value: product.category),
            Divider(),
            ProductDetailRow(label: 'Brand', value: product.brand),
            Divider(),
            ProductDetailRow(label: 'RAM', value: '${product.ram} GB'),
            Divider(),
            ProductDetailRow(label: 'Processor', value: '${product.processor}'),
            Divider(),
            ProductDetailRow(label: 'Camera', value: '${product.camera}'),
            Divider(),
            ProductDetailRow(label: 'Battery', value: '${product.battery} mAh'),
            Divider(),
            ProductDetailRow(label: 'Storage', value: '${product.storage} GB'),
            Divider(),
            ProductDetailRow(label: 'Network Connectivity', value: '${product.networkConnectivity}'),
            Divider(),
            ProductDetailRow(label: 'Color', value: product.color ?? 'Unknown Color'),
            Divider(),
            ProductDetailRow(label: 'Display Size', value: '${product.displaySize}'),
            Divider(),
            ProductDetailRow(label: 'Material', value: '${product.material}'),
            Divider(),
            ProductDetailRow(label: 'Features', value: '${product.features}'),
            Divider(),
            ProductDetailRow(label: 'Price', value: '₹${product.price.toStringAsFixed(2)}'),
            Divider(),
            ProductDetailRow(label: 'Quantity', value: '${product.quantity}'),
          ],
        ),
      ),
    );
  }
}
