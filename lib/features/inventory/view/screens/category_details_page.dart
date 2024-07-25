
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controller/product_full_details.dart';
// import '../../controller/product_services.dart';
// import '../widgets/product/product_show_card.dart';


// class CategoryDetailPage extends StatelessWidget {
//   final String category;

//   CategoryDetailPage({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     final productService = Provider.of<ProductService>(context);
//     productService.getProducts();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff03448c),
//         title: Text('$category Products'),
//       ),
//       body: Consumer<ProductService>(builder: (context, value, child) {
//         var filterProducts = value.productsMy.where((element) => element.category == category).toList();

//         return GridView.builder(
//           padding: EdgeInsets.all(6.0),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: filterProducts.length,
//           itemBuilder: (context, index) {
//             final product = filterProducts[index];

//             return ProductShowCard(
//               imageUrl: product.image ?? 'https://via.placeholder.com/150',
//               productName: product.productName,
//               color: product.color ?? 'Unknown Color',
//               price: '₹${product.price.toStringAsFixed(2)}',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductFullDetails(),
//                   ),
//                 );
//               },
//               onLongPress: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Container(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             'Delete Product',
//                             style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 16.0),
//                           Text('Are you sure you want to delete this product?'),
//                           SizedBox(height: 16.0),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   productService.deleteProduct(product.productId);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('Delete'),
//                                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('Cancel'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/product_services.dart';
import '../widgets/product/product_navigator.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  CategoryDetailPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    productService.getProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03448c),
        title: Text('$category Products'),
      ),
      body: Consumer<ProductService>(builder: (context, value, child) {
        var filterProducts = value.productsMy.where((element) => element.category == category).toList();

        return GridView.builder(
          padding: EdgeInsets.all(6.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          itemCount: filterProducts.length,
          itemBuilder: (context, index) {
            final product = filterProducts[index];

            return ProductNavigator(product: product);
          },
        );
      }),
    );
  }
}


