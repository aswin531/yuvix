import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/product_services.dart';
import '../../../models/product_model.dart';
import '../mobiles/edit.dart';


class EditProductDialog extends StatelessWidget {
  final ProductModel product;

  EditProductDialog({required this.product});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: product.productName);
    final _priceController = TextEditingController(text: product.price.toString());
    final _categoryController = TextEditingController(text: product.category);
    final _colorController = TextEditingController(text: product.color);
    final _ramController = TextEditingController(text: product.ram.toString());
    final _processorController = TextEditingController(text: product.processor);
    final _cameraController = TextEditingController(text: product.camera);
    final _batteryController = TextEditingController(text: product.battery.toString());
    final _storageController = TextEditingController(text: product.storage.toString());
    final _quantityController = TextEditingController(text: product.quantity.toString());
    final _brandController = TextEditingController(text: product.brand);
    final _displayController = TextEditingController(text: product.displaySize);
    final _networkController = TextEditingController(text: product.networkConnectivity);

    return AlertDialog(
      title: Text('Edit Product'),
      content: SingleChildScrollView(
        child: Column(
          children: [
           EditTextField(controller:_nameController,label: 'Product Name'),
           EditTextField(controller:_priceController, label: 'Price', keyboardType:TextInputType.number),
           EditTextField(controller:_categoryController, label: 'Category'),
           EditTextField(controller:_colorController, label: 'Color'),
           EditTextField(controller:_ramController, label: 'RAM (GB)', keyboardType:TextInputType.number),
           EditTextField(controller:_processorController, label: 'Processor'),
           EditTextField(controller:_cameraController, label: 'Camera'),
           EditTextField(controller:_batteryController, label: 'Battery (mAh)',keyboardType: TextInputType.number),
           EditTextField(controller:_storageController, label: 'Storage (GB)', keyboardType:TextInputType.number),
           EditTextField(controller: _quantityController, label: 'Quantity', keyboardType:TextInputType.number),
           EditTextField(controller:_brandController, label:'Brand'),
           EditTextField(controller:_displayController, label:'Display Size'),
           EditTextField(controller:_networkController, label: 'Network Connectivity'),
            EditTextField(controller:_colorController, label: 'Compatibility'),
           EditTextField(controller:_ramController,label:  'Material'),
           EditTextField(controller:_processorController, label: 'Features'),
           EditTextField(controller:_cameraController, label: 'Color'),
           EditTextField(controller:_batteryController,label: 'Price', keyboardType:TextInputType.number),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final updatedProduct = ProductModel(
              productId: product.productId,
              productName: _nameController.text,
              brand: _brandController.text,
              image: product.image,
              category: _categoryController.text,
              ram: _ramController.text,
              processor: _processorController.text,
              camera: _cameraController.text,
              battery: _batteryController.text,
              storage: _storageController.text,
              displaySize: _displayController.text,
              networkConnectivity: _networkController.text,
              quantity: int.parse(_quantityController.text),
              color: _colorController.text,
              price: double.parse(_priceController.text),
            );

            Provider.of<ProductService>(context, listen: false)
                .updateProduct(updatedProduct);

            Navigator.pop(context);
          },
          child: Text('Update'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

}
