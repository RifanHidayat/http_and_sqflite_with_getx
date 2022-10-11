import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/assets/images.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/views/activity.dart';
import 'package:test_pt_kb_insurance/views/activity/tab.dart';
import 'package:test_pt_kb_insurance/views/attendance.dart';
import 'package:test_pt_kb_insurance/widgets/card_menu.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: ColorsApp.decoration,
        ),
        title: TextLabel(
          text: "Home",
          color: ColorsApp.white,
          font: FontApp.interBold,
          size: SizeApp.LargelSize,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CardMenu(
              text: "Activity",
              images: ImagesApp.activity,
              navigate: TabActivity(),
            ),
            CardMenu(
              text: "Attendance",
              images: ImagesApp.attendance,
              navigate: AttendancePage(),
            ),
          ],
        ),
      ),
    );
  }
}
