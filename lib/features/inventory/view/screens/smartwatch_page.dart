import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../widgets/product/other/show_dialog.dart';
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
            onPressed: () => showEditDialog(context, product),
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
}
