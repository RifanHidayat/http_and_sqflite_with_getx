import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';

class TextLabel extends StatelessWidget {
  TextLabel({super.key, required this.text, this.color, this.font, this.size});
  final text;
  final color;
  final font;
  final size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? ColorsApp.black,
          fontFamily: font ?? FontApp.interRegular,
          fontSize: size ?? SizeApp.normalSize),
    );
  }
}
