
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';
import 'package:yuvix/features/inventory/models/productmodel.dart';

class CategoryDetailPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03448c),
        title: Text('Product View'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // filter
                    },
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    label: Text('Filters', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {
                      // sort
                    },
                    child: Text('Sort By'),
                  ),
                  SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {
                      // price filter
                    },
                    child: Text('Price'),
                  ),
                  SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {
                      // brand filter
                    },
                    child: Text('Brand'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
        
              child: FutureBuilder(
                future:productService.getProducts(),
                builder: (context , snapshot){
                  final product = snapshot.data!;
                  return GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imageUrl: '',
                      productName: 'Samsung Galaxy F15 5G',
                      color: 'black',
                      price: '₹16,499',
                    );
                  },
                );
                },
                 
              ),
            ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String color;
  final String price;

  const ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.color,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 100),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(color),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    SizedBox(width: 4.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controller/product_services.dart';
// import '../../models/productmodel.dart';


// class CategoryDetailPage extends StatelessWidget {
//   final String category;

//   CategoryDetailPage({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     final productService = Provider.of<ProductService>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff03448c),
//         title: Text('${category} Products'),
//       ),
//       body: FutureBuilder<List<ProductModel>>(
//         future: productService.getProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No products available'));
//           }

//           // Filter products by category
//           final categoryProducts = snapshot.data!
//               .where((product) => product.category == category)
//               .toList();

//           if (categoryProducts.isEmpty) {
//             return Center(child: Text('No products available in this category'));
//           }

//           return GridView.builder(
//             padding: EdgeInsets.all(8.0),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 0.7,
//             ),
//             itemCount: categoryProducts.length,
//             itemBuilder: (context, index) {
//               final product = categoryProducts[index];
//               return ProductCard(
//                 imageUrl: product.image ?? 'https://via.placeholder.com/150',
//                 productName: product.productName ?? 'Unnamed Product',
//                 color: product.color ?? 'Unknown Color',
//                 price: '₹${product.price.toStringAsFixed(2) ?? '0.00'}',
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final String imageUrl;
//   final String productName;
//   final String color;
//   final String price;

//   const ProductCard({
//     required this.imageUrl,
//     required this.productName,
//     required this.color,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity, height: 100),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   productName,
//                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4.0),
//                 Text(color),
//                 SizedBox(height: 4.0),
//                 Row(
//                   children: [
//                     Text(
//                       price,
//                       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange),
//                     ),
//                     SizedBox(width: 4.0),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
