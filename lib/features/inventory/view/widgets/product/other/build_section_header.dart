import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildSectionHeaderWidget extends StatelessWidget {
  String title;
  VoidCallback onSeeMore;
   BuildSectionHeaderWidget({super.key,required this.onSeeMore,required this.title});

  @override
  Widget build(BuildContext context) {
 return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onSeeMore,
          child: Text(
            'See more',
            style: TextStyle(fontSize: 15, color: const Color.fromARGB(255, 14, 12, 168)),
          ),
        ),
      ],
    );  }
}