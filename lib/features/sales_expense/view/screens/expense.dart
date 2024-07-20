  
import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
      ),
      body: 
      Container(
         height: double.infinity,
    width: double.infinity,
        child: const Center(
          child: Text('Expense Page'),
        ),
      ),
    );
  }
}