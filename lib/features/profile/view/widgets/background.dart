

import 'package:flutter/material.dart';

import '../../../../core/constants/color.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ConstC.getColor(AppColor.background1),
            const Color(0xff281537),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 60.0, left: 22),
        child: Text(
          'Create Your\nAccount',
          style: TextStyle(
            fontSize: 30,
            color: ConstC.getColor(AppColor.textC1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
