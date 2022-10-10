import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class GroupTextColumn extends StatelessWidget {
  GroupTextColumn({super.key, this.title, this.subTitle});
  final title;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLabel(
            text: title,
            font: FontApp.interBold,
          ),
          TextLabel(text: subTitle)
        ],
      ),
    );
  }
}
