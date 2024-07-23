
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/brand_services.dart';
import 'package:yuvix/features/inventory/view/widgets/brand/brand_card.dart';

import '../../../models/brand_model.dart';




class BrandGridView extends StatelessWidget {
  final List<BrandModel> categories;
   BrandGridView({super.key, required this.categories});
 
 
  @override
  Widget build(BuildContext context) {
    final brandService = Provider.of<BrandService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body:FutureBuilder(
        future: brandService.getBrands() ,
        builder: (context , snapshot){
          if(snapshot.hasError || snapshot.data == null){
            return Center(
              child: Text('no data found!!!'),
            );
          }
          return 
          GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
             final brand = snapshot.data![index];
            return BrandCard(brand: brand);
          },
        );
        },
      
      ),
    );
  }
}








