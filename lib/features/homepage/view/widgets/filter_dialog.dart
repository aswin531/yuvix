
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';
import 'package:yuvix/features/homepage/view/screen/filter_display.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> _priceFilters = [];
  List<String> _colorFilters = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Options'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FilterOption(
              title: 'Price',
              options: ['Under ₹15,000', '₹15,000 - ₹30,000', '₹30,000 - ₹60,000', 'Above ₹60,000'],
              onChanged: (selectedOptions) {
                setState(() {
                  _priceFilters = selectedOptions;
                });
              },
            ),
            FilterOption(
              title: 'Color',
              options: ['Black', 'Blue', 'Red', 'Green', 'White', 'Purple', 'Silver'],
              onChanged: (selectedOptions) {
                setState(() {
                  _colorFilters = selectedOptions;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Apply'),
          onPressed: () {
            final filters = <String, List<String>>{};

            if (_priceFilters.isNotEmpty) {
              filters['Price'] = _priceFilters;
            }
            if (_colorFilters.isNotEmpty) {
              filters['Color'] = _colorFilters;
            }

            // Apply the filters using the ProductService provider
            Provider.of<ProductService>(context, listen: false).filterProducts(filters);

            // Navigate to FilterDisplayPage
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FilterDisplayPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FilterOption extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(List<String>) onChanged;

  FilterOption({required this.title, required this.options, required this.onChanged});

  @override
  _FilterOptionState createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      children: widget.options.map((option) {
        return CheckboxListTile(
          title: Text(option),
          value: selectedOptions.contains(option),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                selectedOptions.add(option);
              } else {
                selectedOptions.remove(option);
              }
            });
            widget.onChanged(selectedOptions);
          },
        );
      }).toList(),
    );
  }
}


