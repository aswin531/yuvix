import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';


class FilterDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Products'),
      ),
      body: Consumer<ProductService>(
        builder: (context, productService, child) {
          return ListView.builder(
            itemCount: productService.searchResults.length,
            itemBuilder: (context, index) {
              final product = productService.searchResults[index];
              return ListTile(
                title: Text(product.productName),
                subtitle: Text('₹${product.price} - ${product.color}'),
              );
            },
          );
        },
      ),
    );
  }
}
