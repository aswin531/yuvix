import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;

  const EditTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
    );
  }
}
