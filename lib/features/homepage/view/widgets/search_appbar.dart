
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yuvix/core/constants/color.dart';
// import 'package:yuvix/features/homepage/view/widgets/filter_dialog.dart';
// import 'package:yuvix/features/inventory/controller/product_services.dart';

// class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final TextEditingController searchController;

//   SearchAppBar({required this.searchController});

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductService>(context, listen: false);

//     return AppBar(
//       backgroundColor: ConstC.getColor(AppColor.appBar),
//       elevation: 0,
//       iconTheme: IconThemeData(color: ConstC.getColor(AppColor.icon1)),
//       title: TextField(
//         controller: searchController,
//         decoration: InputDecoration(
//           hintText: 'Search...',
//           border: InputBorder.none,
//           suffixIcon: searchController.text.isNotEmpty
//               ? IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     searchController.clear();
//                     productProvider.searchProducts('');
//                   },
//                 )
//               : null,
//         ),
//         style: TextStyle(fontSize: 18.0),
//         onChanged: (query) {
//           productProvider.searchProducts(query);
//         },
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.filter_list),
//           onPressed: () {
//             _showFilterDialog(context);
//           },
//         ),
//       ],
//     );
//   }

//   void _showFilterDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return FilterDialog();
//       },
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
