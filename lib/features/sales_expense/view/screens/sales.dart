
import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
      ),
      body: 
      Container(
         height: double.infinity,
    width: double.infinity,
        child: const Center(
          child: Text('Sales Page'),
        ),
      ),
    );
  }
}