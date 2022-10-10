import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class GroupTextColumnList extends StatelessWidget {
  GroupTextColumnList({super.key, this.title, required this.subTitle});
  final title;
  List subTitle;

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(subTitle.length, (index) {
              return TextLabel(text: "- ${subTitle[index].toString()}");
            }),
          )
        ],
      ),
    );
  }
}
