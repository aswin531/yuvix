import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/sales_service.dart';

class SalesAddPage extends StatefulWidget {
  @override
  _SalesAddPageState createState() => _SalesAddPageState();
}

class _SalesAddPageState extends State<SalesAddPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _productController = TextEditingController();
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> _products = [
    {'name': 'Product 1', 'amount': '10.00'},
    {'name': 'Product 2', 'amount': '20.00'},
  ];

  @override
  void initState() {
    super.initState();
    _dateController.text = DateTime.now().toString().split(' ')[0];
  }
void _selectProduct() {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      String selectedCategory = '';
      TextEditingController quantityController = TextEditingController();
      TextEditingController searchController = TextEditingController();
      List<Map<String, dynamic>> filteredProducts = [];

      void filterProducts() {
        setState(() {
          filteredProducts = _products.where((product) {
            final categoryMatch = product['category'] == selectedCategory;
            final nameMatch = product['name']
                .toLowerCase()
                .contains(searchController.text.toLowerCase());
            return categoryMatch && nameMatch;
          }).toList();
        });
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCategory.isEmpty ? null : selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue!;
                  searchController.clear();
                  filteredProducts = _products
                      .where((product) => product['category'] == selectedCategory)
                      .toList();
                });
              },
              items: <String>['Category 1', 'Category 2', 'Category 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Select Category'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(labelText: 'Search Product'),
              onChanged: (value) => filterProducts(),
              enabled: selectedCategory.isNotEmpty,
            ),
            SizedBox(height: 10),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
              enabled: selectedCategory.isNotEmpty,
            ),
            SizedBox(height: 10),
             TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
              enabled: selectedCategory.isNotEmpty,
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
    final productName = _productController.text;
    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final pricePerUnit = double.tryParse(_priceController.text) ?? 0.0;

    if (date.isEmpty ||
        customerName.isEmpty ||
        mobileNumber.isEmpty ||
        productName.isEmpty ||
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
    double totalAmount = _products.fold(
        0.0, (sum, product) => sum + double.parse(product['amount']));

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
                          _dateController.text =
                              selectedDate.toString().split(' ')[0];
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _customerNameController,
                decoration: InputDecoration(
                  labelText: 'Customer Name',
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                  labelText: 'Select Product',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: _selectProduct,
                  ),
                ),
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
              Text('User Name: John Doe'),
              Text('Mobile Number: 123-456-7890'),
              SizedBox(height: 8.0),
              for (var product in _products)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product['name']),
                    Text('\$${product['amount']}'),
                  ],
                ),
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
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
