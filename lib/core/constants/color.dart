


import 'package:flutter/material.dart';

enum AppColor {
  scaffold,
  appBar,
  background1,
  background2,
  icon1,
  icon2,
  icon3,
  text,
  textC1,
  textC2,
  textC3,
  buttonBackground,  
  buttonBackground2,         
  border,           
}

class ConstC {
  static const Map<AppColor, Color> colors = {
    AppColor.scaffold: Colors.white,   
    AppColor.appBar: Color(0xff03448c),                    
    AppColor.background1: Color(0xff03448c),               
    AppColor.background2: Colors.white38,                   
    AppColor.icon1: Colors.white,                          
    AppColor.icon2: Color.fromARGB(255, 190, 179, 179),  
    AppColor.icon3: Colors.black, 
    AppColor.text:Colors.black54  ,                        
    AppColor.textC1: Colors.white,                       
    AppColor.textC2: Colors.black, 
     AppColor.textC3: Color(0xff03448c),                          
    AppColor.buttonBackground: Color(0xff0d47a1),  
    AppColor.buttonBackground2:Colors.red ,                     
    AppColor.border: Color(0xff90caf9),                   
  };

  static Color getColor(AppColor color) {
    return colors[color]!;
  }
}
