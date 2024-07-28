import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/product_services.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      productProvider.searchProducts(''); // Clear search results
                    },
                  )
                : null,
          ),
          style: TextStyle(fontSize: 18.0),
          onChanged: (query) {
            productProvider.searchProducts(query); // Update search results
          },
        ),
      ),
      body: Consumer<ProductService>(
        builder: (context, provider, child) {
          if (provider.searchResults.isEmpty && _searchController.text.isNotEmpty) {
            return Center(
              child: Text('No results found'),
            );
          } else {
            return ListView.builder(
              itemCount: provider.searchResults.length,
              itemBuilder: (context, index) {
                final product = provider.searchResults[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(product.image ?? '')),
                    ),
                    title: Text(
                      product.productName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: ₹${product.price}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
