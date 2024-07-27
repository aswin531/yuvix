import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/product_services.dart';
import '../../../models/product_model.dart';


class EditAccessories extends StatelessWidget {
  final ProductModel product;

  EditAccessories({required this.product});

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
    // final _quantityController = TextEditingController(text: product.quantity.toString());
    final _brandController = TextEditingController(text: product.brand);
    final _displayController = TextEditingController(text: product.displaySize);
    final _networkController = TextEditingController(text: product.networkConnectivity);

    return AlertDialog(
      title: Text('Edit Product'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(_nameController, 'Product Name'),
            _buildTextField(_priceController, 'Price', TextInputType.number),
            _buildTextField(_categoryController, 'Category'),
            _buildTextField(_colorController, 'Color'),
            _buildTextField(_ramController, 'RAM (GB)', TextInputType.number),
            _buildTextField(_processorController, 'Processor'),
            _buildTextField(_cameraController, 'Camera'),
            _buildTextField(_batteryController, 'Battery (mAh)', TextInputType.number),
            _buildTextField(_storageController, 'Storage (GB)', TextInputType.number),
            // _buildTextField(_quantityController, 'Quantity', TextInputType.number),
            _buildTextField(_brandController, 'Brand'),
            _buildTextField(_displayController, 'Display Size'),
            _buildTextField(_networkController, 'Network Connectivity'),
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
              // quantity: int.parse(_quantityController.text),
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
            Navigator.pop(context,1);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, [TextInputType keyboardType = TextInputType.text]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
    );
  }
}
