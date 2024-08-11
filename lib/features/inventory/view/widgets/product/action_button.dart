import 'package:flutter/material.dart';

import '../../../../../core/constants/color.dart';

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
            backgroundColor:  ConstC.getColor(AppColor.buttonBackground2),
            foregroundColor:  ConstC.getColor(AppColor.textC1),
            fixedSize: Size(100, 50),
          ),
        ),
        ElevatedButton(
          onPressed: onAdd,
          child: Text('Add'),
          style: ElevatedButton.styleFrom(
            backgroundColor:  ConstC.getColor(AppColor.background1),
            foregroundColor:  ConstC.getColor(AppColor.textC1),
            fixedSize: Size(100, 50),
          ),
        ),
      ],
    );
  }
}
