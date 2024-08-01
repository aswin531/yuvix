import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../widgets/mobiles/edit_dialogue.dart';
import '../widgets/smartwatch/product_watch.dart';


class SmartwatchPage extends StatelessWidget {
  final ProductModel product;

  SmartwatchPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _showEditDialog(context, product),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: WatchProductDetails(product: product),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) => EditProductDialog(product: product),
    );
  }
}
