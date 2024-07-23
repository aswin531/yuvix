import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const ImagePickerWidget({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: image == null
            ? Center(
                child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
              )
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}