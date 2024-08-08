 import 'package:flutter/material.dart';
enum AppColor {
  scaffold,
  appBar,
  background1,
  background2,
  icon1,
  icon2,
  textC1,
  textC2
}

class ColorsConfig {
  static const Map<AppColor, Color> colors = {
    AppColor.scaffold: Color.fromARGB(255, 98, 16, 160),
    AppColor.appBar: Color(0xff03448c),
    AppColor.background1: Color(0xff03448c),
    AppColor.background2:Colors.red,
    AppColor.icon1: Colors.white,
    AppColor.icon2: Colors.grey,
    AppColor.textC1: Colors.white,
    AppColor.textC2: Colors.black,
    
  };

  static Color getColor(AppColor color) {
    return colors[color]!;
  }
}
