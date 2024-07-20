import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 18.0),
          onSubmitted: (query) {
            
            print('Search query: $query');
        
          },
        ),
      ),
      body: Center(
        child: Text('Search Results'),
      ),
    );
  }
}
