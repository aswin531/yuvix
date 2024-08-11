

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yuvix/features/inventory/controller/product_services.dart';

// class SearchResults extends StatelessWidget {
//   final TextEditingController searchController;

//   SearchResults({required this.searchController});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     final productProvider = Provider.of<ProductService>(context);

//     return Consumer<ProductService>(
//       builder: (context, provider, child) {
//         if (provider.filteredProducts.isEmpty && searchController.text.isNotEmpty) {
//           return Center(
//             child: Text('No results found'),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: provider.filteredProducts.isNotEmpty
//                 ? provider.filteredProducts.length
//                 : provider.products.length,
//             itemBuilder: (context, index) {
//               final product = provider.filteredProducts.isNotEmpty
//                   ? provider.filteredProducts[index]
//                   : provider.products[index];
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: product.image != null && product.image!.isNotEmpty
//                         ? FileImage(File(product.image!))
//                         : AssetImage('assets/placeholder.png') as ImageProvider,
//                   ),
//                   title: Text(
//                     product.productName,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text('Price: ₹${product.price}'),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
