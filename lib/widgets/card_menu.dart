import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/images.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class CardMenu extends StatelessWidget {
  final text;
  final images;
  Widget navigate;
  CardMenu({super.key, this.text, this.images, required this.navigate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: navigate));
      },
      child: Container(
        height: Get.size.width / 3,
        width: Get.size.width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(width: 1, color: ColorsApp.black.withOpacity(0.5))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                images,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              TextLabel(
                text: text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
