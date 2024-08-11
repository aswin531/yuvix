 
 import 'package:flutter/material.dart';
import 'package:yuvix/features/inventory/models/product_model.dart';
import 'package:yuvix/features/inventory/view/widgets/mobiles/edit_dialogue.dart';

void showEditDialog(BuildContext context, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) => EditProductDialog(product: product),
    );
  }

