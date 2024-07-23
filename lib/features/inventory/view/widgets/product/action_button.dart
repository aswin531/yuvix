import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onAdd;

  const ActionButtons({
    required this.onCancel,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onCancel,
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            fixedSize: Size(100, 50),
          ),
        ),
        ElevatedButton(
          onPressed: onAdd,
          child: Text('Add'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            fixedSize: Size(100, 50),
          ),
        ),
      ],
    );
  }
}
