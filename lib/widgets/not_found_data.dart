import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/images.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';

class NotFoundData extends StatelessWidget {
  const NotFoundData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.width / 2,
      height: SizeApp.height / 2,
      child: Center(
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Image.asset(ImagesApp.noImagesData))),
    );
  }
}
