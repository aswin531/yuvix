    
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yuvix/features/inventory/view/widgets/brand/brandcard.dart';
import 'package:yuvix/features/inventory/view/widgets/product/other/build_section_header.dart';

import 'package:provider/provider.dart'; 

import 'package:yuvix/features/inventory/models/categorymodel.dart'; 
import 'package:yuvix/features/inventory/models/brandmodel.dart';
import '../../controller/brand_services.dart';
import '../../controller/category_Service.dart';
import '../widgets/brand/add_brand.dart';
import '../widgets/brand/brandgrid.dart';
import '../widgets/catogary/add_category_widget.dart';
import '../widgets/catogary/categorycard.dart';
import '../widgets/catogary/categorygrid.dart';
import '../widgets/product/add_product.dart'; 

class InventoryPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    
    final categoryService = Provider.of<CategoryService>(context);
    final brandService = Provider.of<BrandService>(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                     gradient: LinearGradient(
                      colors: [Color(0xff281537), Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(27))
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    'UVIX',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('Assets/images/logo.png'),
                    radius: 25,
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 17,
                  right: 17,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     AddCategoryCard(title:'Category' , ),
                     AddBrandCard(title: 'Brand'),
                     AddProductCard(title:'Product',),
                    
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     BuildSectionHeaderWidget(title: "Category",onSeeMore: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryGridView(categories: [],),));
                    },),
                    SizedBox(height: 10),


                    FutureBuilder<List<CategoryModel>>(
                      future: categoryService.getCategories(), 
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator(); 
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}'); 
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No categories found'); // 
                        } else {
                          log(snapshot.data!.length.toString());
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                            
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {

                                final category = snapshot.data![index];

                                return CatCard(cat: category,);
                              },
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    BuildSectionHeaderWidget(title: "Brand",onSeeMore: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BrandGridView(categories: []),));
                    },),
                    SizedBox(height: 10),
                    FutureBuilder<List<BrandModel>>(
                      future: brandService.getBrands(), 
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}'); 
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No brands found'); 
                        } else {
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final brand = snapshot.data![index];
                                return brandCard(brand: brand,);
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



