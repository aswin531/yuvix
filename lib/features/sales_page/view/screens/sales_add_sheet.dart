import 'package:flutter/material.dart';


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
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Search Product'),
              ),
              // Dummy product list
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_products[index]['name']),
                      subtitle: Text('Price: \$${_products[index]['amount']}'),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          // Update product selection logic
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
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
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 5.0),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: Text('Add Product'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
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
                    onPressed: () {
                      
                    },
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
