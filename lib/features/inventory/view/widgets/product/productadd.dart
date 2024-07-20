
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart'; // Newly added
import 'package:yuvix/features/inventory/controller/category_Service.dart';
import 'package:yuvix/features/inventory/models/categorymodel.dart';
import 'package:yuvix/features/inventory/models/brandmodel.dart';
import 'package:yuvix/features/inventory/models/productmodel.dart'; // Newly added

import '../../../controller/brand_services.dart';
import '../../../controller/product_services.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController ramController = TextEditingController();
  final TextEditingController processorController = TextEditingController();
  final TextEditingController cameraController = TextEditingController();
  final TextEditingController batteryController = TextEditingController();
  final TextEditingController storageController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController displaySizeController = TextEditingController();
  final TextEditingController networkConnectivityController =
      TextEditingController();
  final TextEditingController featuresController = TextEditingController();
  final TextEditingController compatibilityController = TextEditingController();
  final TextEditingController materialController = TextEditingController();

  File? _image;
  String? _selectedBrand;
  String? _selectedType;
  late Future<List<CategoryModel>> _categoriesFuture;
  late Future<List<BrandModel>> _brandsFuture;

  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    super.initState();
    _categoriesFuture = CategoryService().getCategories();
    _brandsFuture = BrandService().getBrands();
  }


  Future<void> addProduct() async { 
    if (productNameController.text.isEmpty || _image == null || _selectedType == null || _selectedBrand == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields and select an image.')),
      );
      return ;
    }

    final newProduct = ProductModel(
      productId: DateTime.now().millisecondsSinceEpoch,
      productName: productNameController.text,
      category: _selectedType!,
      brand: _selectedBrand!,
      image: _image!.path,
      ram: ramController.text,
      processor: processorController.text,
      camera: cameraController.text,
      battery: batteryController.text,
      storage: storageController.text,
      quantity: int.tryParse(quantityController.text) ?? 0,
      price: double.tryParse(priceController.text) ?? 0.0,
      color: colorController.text,
      displaySize: displaySizeController.text,
      networkConnectivity: networkConnectivityController.text,
      features: featuresController.text,
      compatibility: compatibilityController.text,
      material: materialController.text,
    );

    await Provider.of<ProductService>(context, listen: false).addProduct(newProduct); // Newly added

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product Added')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(productNameController, 'Product Name'),
            SizedBox(height: 20),
            _buildCategoryDropdown(),
            SizedBox(height: 20),
            _buildBrandDropdown(),
            SizedBox(height: 20),
            _buildImagePicker(),
            SizedBox(height: 20),
            _buildConditionalFields(),
            SizedBox(height: 20),
            _buildTextField(quantityController, 'Quantity'),
            SizedBox(height: 20),
            _buildTextField(colorController, 'Color'),
            SizedBox(height: 20),
            _buildTextField(priceController, 'Price'),
            SizedBox(height: 20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return FutureBuilder<List<CategoryModel>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<CategoryModel> categories = snapshot.data ?? [];

          return DropdownButtonFormField<String>(
            value: _selectedType,
            onChanged: (value) {
              setState(() {
                _selectedType = value;
              });
            },
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category.categoryName,
                child: Text(category.categoryName ?? 'Unknown'),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
          );
        }
      },
    );
  }

  Widget _buildBrandDropdown() {
    return FutureBuilder<List<BrandModel>>(
      future: _brandsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BrandModel> brands = snapshot.data ?? [];

          return DropdownButtonFormField<String>(
            value: _selectedBrand,
            onChanged: (value) {
              setState(() {
                _selectedBrand = value;
              });
            },
            items: brands.map<DropdownMenuItem<String>>((BrandModel brand) {
              return DropdownMenuItem<String>(
                value: brand.brandName,
                child: Text(brand.brandName ?? 'Unnamed Brand'),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Brand',
              border: OutlineInputBorder(),
            ),
          );
        }
      },
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: getImage,
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _image == null
            ? Center(
                child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
              )
            : Image.file(_image!, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildConditionalFields() {
    if (_selectedType == null) return SizedBox.shrink();

    if (_selectedType == 'Mobiles' ||
        _selectedType == 'Smartphone' ||
        _selectedType == 'Tablet') {
      return Column(
        children: [
          _buildTextField(ramController, 'RAM'),
          SizedBox(height: 20),
          _buildTextField(processorController, 'Processor'),
          SizedBox(height: 20),
          _buildTextField(cameraController, 'Camera'),
          SizedBox(height: 20),
          _buildTextField(batteryController, 'Battery'),
          SizedBox(height: 20),
          _buildTextField(storageController, 'Storage'),
          SizedBox(height: 20),
          _buildTextField(displaySizeController, 'Display Size'),
          SizedBox(height: 20),
          _buildTextField(
              networkConnectivityController, 'Network Connectivity'),
        ],
      );
    } else if (_selectedType == 'Smartwatch') {
      return Column(
        children: [
          _buildTextField(displaySizeController, 'Display Size'),
          SizedBox(height: 20),
          _buildTextField(batteryController, 'Battery Life'),
          SizedBox(height: 20),
          _buildTextField(compatibilityController, 'Compatibility'),
          SizedBox(height: 20),
          _buildTextField(featuresController, 'Features'),
        ],
      );
    } else if (_selectedType == 'Accessories') {
      return Column(
        children: [
          _buildTextField(compatibilityController, 'Compatibility'),
          SizedBox(height: 20),
          _buildTextField(materialController, 'Material'),
          SizedBox(height: 20),
          _buildTextField(featuresController, 'Features'),
        ],
      );
    }

    return Column(
      children: [
        _buildTextField(ramController, 'RAM'),
        SizedBox(height: 20),
        _buildTextField(processorController, 'Processor'),
        SizedBox(height: 20),
        _buildTextField(cameraController, 'Camera'),
        SizedBox(height: 20),
        _buildTextField(batteryController, 'Battery'),
        SizedBox(height: 20),
        _buildTextField(storageController, 'Storage'),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: Size(100, 50), 
        ),),
        ElevatedButton(
          onPressed: addProduct,
          child: Text('Add'),
          style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      fixedSize: Size(100, 50), 
        ),),
      ],
    );
  }
}


