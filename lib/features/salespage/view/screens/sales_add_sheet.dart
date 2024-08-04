
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';
import 'package:yuvix/features/inventory/models/category_model.dart';
import 'package:yuvix/features/salespage/controller/sales_service.dart';

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

  List<Map<String, dynamic>> _salesList = [];

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
                          subtitle: Text('₹${product.price}'),
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

  void _clearProductFields() {
    setState(() {
      _selectedProduct = null;
      _quantityController.clear();
      _priceController.clear();
    });
  }

  void _addProduct() {
    final productName = _selectedProduct;
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final pricePerUnit = double.tryParse(_priceController.text) ?? 0.0;
    final totalPrice = quantity * pricePerUnit;

    if (productName == null || quantity <= 0 || pricePerUnit <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields correctly')),
      );
      return;
    }

    setState(() {
      _salesList.add({
        'productName': productName,
        'quantity': quantity,
        'pricePerUnit': pricePerUnit,
        'totalPrice': totalPrice,
      });
    });

    _clearProductFields();
  }

  void _submitSales() {
    final date = _dateController.text;
    final customerName = _customerNameController.text;
    final mobileNumber = _mobileNumberController.text;

    if (date.isEmpty || customerName.isEmpty || mobileNumber.isEmpty || _salesList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields correctly')),
      );
      return;
    }

    double totalAmount = _salesList.fold(0.0, (sum, item) => sum + item['totalPrice']);

    Provider.of<SalesProvider>(context, listen: false).saveSales(
      date: date,
      customerName: customerName,
      mobileNumber: mobileNumber,
      totalAmount: totalAmount,
      salesList: _salesList,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sales details saved successfully')),
    );

    setState(() {
      _salesList.clear();
      _customerNameController.clear();
      _mobileNumberController.clear();
      _clearProductFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = _salesList.fold(0.0, (sum, item) => sum + item['totalPrice']);

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
                readOnly: true,
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
                    onPressed: _addProduct,
                    child: Text('Add Product'),
                  ),
                  ElevatedButton(
                    onPressed: _submitSales,
                    child: Text('Submit'),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              if (_salesList.isNotEmpty)
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _salesList.length,
                      itemBuilder: (context, index) {
                        final sale = _salesList[index];
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(sale['productName']),
                              Text('Qty: ${sale['quantity']}'),
                              Text('₹${sale['totalPrice']}'),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Total Amount: ₹$totalAmount',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

