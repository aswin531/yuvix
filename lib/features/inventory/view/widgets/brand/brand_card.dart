// import 'dart:io';

// import 'package:flutter/material.dart';


// import '../../../models/brand_model.dart';


// class brandCard extends StatelessWidget {
//  brandCard({super.key, required this.brand});

// final BrandModel brand;
//   @override
//   Widget build(BuildContext context) {
//     // final count=brand.productCount ==null ? "0" :brand.productCount.toString();
//     return  Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Container(
//         width: 160,
//         height: 170,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Color(0xff03448c),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//           Container(height:100 ,width:100 ,
//      decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.white,image: DecorationImage(image: FileImage(File(brand.brandImage!)))),   
//         ),
//             SizedBox(height: 7),
//             Text(brand.brandName!),
//             SizedBox(height: 5),
//             // Text(count),
            
          
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import '../../../models/brand_model.dart';
import '../../screens/brand_detail_page.dart';


class BrandCard extends StatelessWidget {
  final BrandModel brand;

  BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrandDetailPage(brand: brand.brandName!)));
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  image: DecorationImage(
                    image: FileImage(File(brand.brandImage!)),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(brand.brandName!),
              SizedBox(height: 5),
              // Text(count),
            ],
          ),
        ),
      ),
    );
  }
}


