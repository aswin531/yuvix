import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';
import 'package:yuvix/features/inventory/models/product_model.dart';

class ProductSelectionBottomSheet extends StatelessWidget {
  final Function(ProductModel) onProductSelected;

  ProductSelectionBottomSheet({required this.onProductSelected});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductService>(
      builder: (context, productService, child) {
        return ListView.builder(
          itemCount: productService.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = productService.filteredProducts[index];
            return ListTile(
              title: Text(product.productName),
              subtitle: Text('Price: ${product.price}'),
              onTap: () {
                onProductSelected(product);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
