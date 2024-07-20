import 'package:flutter/material.dart';

class HorizontalView extends StatelessWidget {
  final List items;
  const HorizontalView({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: items[index],
          );
        },
      ),
    );
  }
}

    

  


  



   