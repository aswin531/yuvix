import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../controller/product_services.dart';

class MobilesFullDetailsPage extends StatelessWidget {
  final ProductModel product;

  MobilesFullDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
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
                  final _displaycontroller=TextEditingController(text:product.displaySize);
                  final _networkcontroller=TextEditingController(text:product.networkConnectivity);

                  return AlertDialog(
                    title: Text('Edit Product'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Product Name'),
                          ),
                          TextField(
                            controller: _priceController,
                            decoration: InputDecoration(labelText: 'Price'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: _categoryController,
                            decoration: InputDecoration(labelText: 'Category'),
                          ),
                          TextField(
                            controller: _colorController,
                            decoration: InputDecoration(labelText: 'Color'),
                          ),
                          TextField(
                            controller: _ramController,
                            decoration: InputDecoration(labelText: 'RAM (GB)'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: _processorController,
                            decoration: InputDecoration(labelText: 'Processor'),
                          ),
                          TextField(
                            controller: _cameraController,
                            decoration: InputDecoration(labelText: 'Camera'),
                          ),
                          TextField(
                            controller: _batteryController,
                            decoration: InputDecoration(labelText: 'Battery (mAh)'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: _storageController,
                            decoration: InputDecoration(labelText: 'Storage (GB)'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: _quantityController,
                            decoration: InputDecoration(labelText: 'Quantity'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: _brandController,
                            decoration: InputDecoration(labelText: 'Brand'),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: ()  {
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
                            displaySize:_displaycontroller.text,
                            networkConnectivity:_networkcontroller.text,
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
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.file(
                  File(product.image ?? 'https://via.placeholder.com/150'),
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                product.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Category: ${product.category}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
               Text(
                'Brand: ${product.brand}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),

              SizedBox(height: 8.0),
               Text(
                'RAM: ${product.ram} GB',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Processor: ${product.processor}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
               
              Text(
                'Camera: ${product.camera}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Battery: ${product.battery} mAh',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Storage: ${product.storage} GB',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                'Network Connectivity: ${product.networkConnectivity}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Color: ${product.color ?? 'Unknown Color'}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Display Size: ₹${product.displaySize}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Quantity: ₹${product.quantity.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
              Text(
                'Price: ₹${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
