import 'package:flutter/material.dart';
import 'package:yuvix/features/inventory/models/brand_model.dart';


class BrandDropdown extends StatelessWidget {
  final Future<List<BrandModel>> brandsFuture;
  final String? selectedBrand;
  final ValueChanged<String?> onChanged;

  const BrandDropdown({
    required this.brandsFuture,
    required this.selectedBrand,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BrandModel>>(
      future: brandsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<BrandModel> brands = snapshot.data ?? [];

          return DropdownButtonFormField<String>(
            value: selectedBrand,
            onChanged: onChanged,
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
}
