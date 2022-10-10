import 'package:flutter/material.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
    required this.title,
    required this.color,
    this.onTap
  });
  final color, title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextLabel(
                  text: title,
                  color: ColorsApp.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
