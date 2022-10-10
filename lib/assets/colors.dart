import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorsApp {
  static const white = Colors.white;
  //static Color blackDefault = HexColor('#282828');

  static Color blackDefault = HexColor('#453F3F');

  static Color baseColor = HexColor('#05B7F4');
  static Color baseColor1 = HexColor('#2481C5');
  static Color black = HexColor('#5E5E5E');
  static Color green = HexColor('#24CE77');
  static Color red = HexColor('#D70C55');

  static BoxDecoration decoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        HexColor('#0FA1E0'),
        HexColor('#00C2FF'),
      ], // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    ),
  );
}
