import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yuvix/features/inventory/controller/product_services.dart';



import '../../../models/category_model.dart';
import '../../screens/category_details_page.dart';
 

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.cat});

final CategoryModel cat;
  @override
  Widget build(BuildContext context) {
    
    print(".,,,,,,,,,,,,,,,,,,,,,,,,${cat.productCount}");
     
    return  Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: (){
         
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryDetailPage(category:cat.categoryName!)));
        },
        child: Container(
          width: 160,
          height: 170,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xff03448c),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(height:100 ,width:100 ,
             decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.white,image: DecorationImage(image: FileImage(File(cat.image!)))),   
          ),
              SizedBox(height: 7),
              Text(cat.categoryName!),
              SizedBox(height: 5),
            //  Text(cat.productCount.toString()),
              SizedBox(height: 5),
              // Text('brandCount'),
            ],
          ),
        ),
      ),
    );
  }
}


