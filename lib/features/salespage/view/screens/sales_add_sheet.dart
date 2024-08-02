
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';
import 'package:yuvix/features/inventory/models/category_model.dart';
import '../../controller/sales_service.dart';

class SalesAddPage extends StatefulWidget {
  @override
  _SalesAddPageState createState() => _SalesAddPageState();
}

class _SalesAddPageState extends State<SalesAddPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  String? _selectedCategory;
  String? _selectedProduct;
  late Future<List<CategoryModel>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _dateController.text = DateTime.now().toString().split(' ')[0];
    _categoriesFuture = Provider.of<CategoryService>(context, listen: false).getCategories();
  }

  void _selectProduct() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        TextEditingController searchController = TextEditingController();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<CategoryModel>>(
                future: _categoriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      onChanged: (newValue) async {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                        if (_selectedCategory != null) {
                          await Provider.of<ProductService>(context, listen: false)
                              .filterProductsByCategory(_selectedCategory!, searchController.text);
                        }
                      },
                      items: snapshot.data!.map((category) {
                        return DropdownMenuItem<String>(
                          value: category.categoryName,
                          child: Text(category.categoryName!),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Select Category'),
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: searchController,
                decoration: InputDecoration(labelText: 'Search Product'),
                onChanged: (query) async {
                  if (_selectedCategory != null) {
                    await Provider.of<ProductService>(context, listen: false)
                        .filterProductsByCategory(_selectedCategory!, query);
                  }
                },
                enabled: _selectedCategory != null,
              ),
              SizedBox(height: 10),
              Consumer<ProductService>(
                builder: (context, productService, child) {
                  final filteredProducts = productService.products;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ListTile(
                          title: Text(product.productName),
                          subtitle: Text('Price: ₹${product.price}'),
                          onTap: () {
                            setState(() {
                              _selectedProduct = product.productName;
                              _priceController.text = product.price.toString();
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveSales(BuildContext context) {
    final date = _dateController.text;
    final customerName = _customerNameController.text;
    final mobileNumber = _mobileNumberController.text;
    final productName = _selectedProduct;
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final pricePerUnit = double.tryParse(_priceController.text) ?? 0.0;

    if (date.isEmpty ||
        customerName.isEmpty ||
        mobileNumber.isEmpty ||
        productName == null ||
        quantity <= 0 ||
        pricePerUnit <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields correctly')),
      );
      return;
    }

    Provider.of<SalesProvider>(context, listen: false).saveSales(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      productName: productName,
      quantity: quantity,
      pricePerUnit: pricePerUnit,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sales details saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0.0; // Update this with the total calculation logic

    return Scaffold(
      appBar: AppBar(title: Text('Sales Add Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _dateController.text = selectedDate.toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _customerNameController,
                decoration: InputDecoration(labelText: 'Customer Name'),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: TextEditingController(text: _selectedProduct),
                decoration: InputDecoration(
                  labelText: 'Select Product',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: _selectProduct,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Product'),
                  ),
                  ElevatedButton(
                    onPressed: () => _saveSales(context),
                    child: Text('Save'),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              // Display dummy data or actual data for user and products added
              SizedBox(height: 8.0),
              // List of products added to the sale
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text('\$${totalAmount.toStringAsFixed(2)}'),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
