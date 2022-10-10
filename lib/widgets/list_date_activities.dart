import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/controllers/activity.dart';
import 'package:test_pt_kb_insurance/controllers/attendance.dart';
import 'package:test_pt_kb_insurance/widgets/button_icon.dart';
import 'package:test_pt_kb_insurance/widgets/group_text_column.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';

// final AttendanceController attendanceController =
//     Get.put(AttendanceController());

final ActivityController activitiesController = Get.put(ActivityController());

class ListDataActivities extends StatelessWidget {
  ListDataActivities(
      {super.key,
      this.title,
      this.subTitle,
      required this.widget,
      this.index,
      this.onTapDelete,
      this.onTapEdit,
      this.isOpen});
  final title, subTitle;
  final index;
  final onTapDelete;
  final onTapEdit;
  Widget widget;
  final isOpen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, color: ColorsApp.black.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              print(isOpen);
              activitiesController.activities[index].isOpen =
                  !activitiesController.activities[index].isOpen;
              activitiesController.activities.refresh();
            },
            child: Row(
              children: [
                Container(
                  width: SizeApp.width * 0.8,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextLabel(
                        text: title,
                        font: FontApp.interBold,
                        size: SizeApp.normalSize,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextLabel(
                        text: subTitle,
                        size: SizeApp.smallSize,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: ColorsApp.black.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(() {
            return activitiesController.activities[index].isOpen == false
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonIconApp(
                            title: "Edit",
                            color: ColorsApp.green,
                            icon: Icons.edit,
                            onTap: onTapEdit,
                          ),
                         
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      widget
                    ],
                  );
          })
        ],
      ),
    );
  }
}
