// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:test_pt_kb_insurance/assets/colors.dart';
// import 'package:test_pt_kb_insurance/assets/fonts.dart';
// import 'package:test_pt_kb_insurance/assets/size.dart';
// import 'package:test_pt_kb_insurance/widgets/button.dart';
// import 'package:test_pt_kb_insurance/widgets/group_text_column.dart';
// import 'package:test_pt_kb_insurance/widgets/list_data.dart';
// import 'package:test_pt_kb_insurance/widgets/text_form_field.dart';
// import 'package:test_pt_kb_insurance/widgets/text_form_field_icon.dart';
// import 'package:test_pt_kb_insurance/widgets/text_label.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class ActivityPage extends StatelessWidget {
//   ActivityPage({super.key});

//   var nikController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: ColorsApp.baseColor,
//         onPressed: () {
//           modalFilter(context);
//           // Add your onPressed code here!
//         },
//         icon: const Icon(Icons.add),
//         label: TextLabel(
//           text: "Activity",
//           color: ColorsApp.white,
//         ),
//       ),
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: ColorsApp.white,
//           ),
//         ),
//         flexibleSpace: Container(
//           decoration: ColorsApp.decoration,
//         ),
//         title: TextLabel(
//           text: "Activity",
//           color: ColorsApp.white,
//           font: FontApp.interBold,
//         ),
//       ),
//       body: Container(
//         width: SizeApp.width,
//         height: SizeApp.height,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: List.generate(10, (index) {
//               return Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
//                   child: ListData(
//                     title: "Title",
//                     subTitle: "Subtitle",
//                     widget: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GroupTextColumn(
//                           title: "Nik",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Nama Karyawan",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Kepala Sekolah",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Kd Dept",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Departement",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Time In",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Time Out",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "status",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Category",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Activity",
//                           subTitle: "-",
//                         ),
//                         GroupTextColumn(
//                           title: "Remart",
//                           subTitle: "-",
//                         ),
//                       ],
//                     ),
//                   ));
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   modalFilter(BuildContext context) async {
//     await showDialog(
//       context: context,
//       builder: (context) {
//         // return Obx(() {
//         return StatefulBuilder(builder: (context, setState) {
//           return SimpleDialog(
//             backgroundColor: ColorsApp.white,
//             title: TextLabel(
//               text: "Activity",
//             ),
//             children: [
//               Divider(),
//               Form(
//                   // key: _formKey,
//                   child: Column(
//                 children: [
//                   TextFormApp(
//                     title: "NIK",
//                     controller: nikController,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       multipleDate(context);
//                     },
//                     child: TextFormApp(
//                       icon: Icon(
//                         Icons.date_range,
//                         color: ColorsApp.black.withOpacity(0.5),
//                       ),
//                       title: "Date",
//                       controller: nikController,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: SizeApp.width / 2 - 40,
//                         child: InkWell(
//                           onTap: () {
//                             showTimePicker(
//                               context: context,
//                               initialTime: TimeOfDay(hour: 7, minute: 15),
//                               initialEntryMode: TimePickerEntryMode.input,
//                             );
//                           },
//                           child: TextFormApp(
//                             enabled: false,
//                             title: "Mulai ",
//                             controller: nikController,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: SizeApp.width / 2 - 40,
//                         child: InkWell(
//                           onTap: () {
//                             showTimePicker(
//                               context: context,
//                               initialTime: TimeOfDay(hour: 7, minute: 15),
//                               initialEntryMode: TimePickerEntryMode.input,
//                             );
//                           },
//                           child: TextFormApp(
//                             enabled: false,
//                             title: "End Time",
//                             controller: nikController,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TextFormApp(
//                     icon: Icon(
//                       Icons.date_range,
//                       color: ColorsApp.black.withOpacity(0.5),
//                     ),
//                     title: "Deadline",
//                     controller: nikController,
//                   ),
//                   TextFormApp(
//                     title: "Remarks",
//                     controller: nikController,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ButtonApp(title: "Cancel", color: Colors.grey[300]),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       ButtonApp(title: "Save", color: ColorsApp.baseColor),
//                     ],
//                   )
//                 ],
//               ))
//             ],
//           );
//         });
//         // });
//       },
//     );
//   }

//   Future multipleDate(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return StatefulBuilder(builder: (context, setState) {
//             return AlertDialog(
//               backgroundColor: ColorsApp.white,
//               content: Container(
//                 width: MediaQuery.of(context).size.width - 40,
//                 height: MediaQuery.of(context).size.height / 2 + 50,
//                 child: Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: const Text(
//                               "Date",
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 13,
//                                   fontFamily: "inter-medium",
//                                   letterSpacing: 0.5),
//                             ),
//                           ),
//                           Expanded(
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.pop(context);
//                                 //  Get.back();
//                               },
//                               child: Container(
//                                 alignment: Alignment.centerRight,
//                                 width: double.maxFinite,
//                                 child: const Icon(
//                                   Icons.close,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     const Divider(
//                       height: 1,
//                       thickness: 1,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                         child: SingleChildScrollView(
//                       child: Container(
//                         child: SfDateRangePicker(
//                           selectionTextStyle: TextStyle(
//                               fontFamily: "inter-regular", fontSize: 12),
//                           // onSelectionChanged: _onSelectionChanged,
//                           selectionMode: DateRangePickerSelectionMode.range,
//                           initialDisplayDate: DateTime.now(),
//                           // initialSelectedDates: _initialSelectedDates,
//                           initialSelectedRange:
//                               PickerDateRange(DateTime.now(), DateTime.now()),
//                         ),
//                       ),
//                     )),
//                     Container(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             width: 80,
//                             height: 30,
//                             child: ElevatedButton(
//                                 onPressed: () {
//                                   // Get.back();
//                                   Navigator.pop(context);
//                                 },
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all(Colors.red),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   )),
//                                 ),
//                                 child: const Text(
//                                   "Cancel",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 11,
//                                       fontFamily: "Roboto-regular"),
//                                 )),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Container(
//                             width: 80,
//                             height: 30,
//                             child: ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     // selectedStartDate = tempSelectedStartDate;
//                                     // selectedEndDate = tempSelectedEndDate;
//                                   });
//                                   // Navigator.pop(context);
//                                   // Navigator.pop(context);
//                                   // showModal();
//                                 },
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.all(
//                                       ColorsApp.baseColor),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   )),
//                                 ),
//                                 child: const Text(
//                                   "Ok",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 11,
//                                       fontFamily: "Roboto-regular"),
//                                 )),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           });
//         });
//   }
// }

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sweetalertv2/sweetalertv2.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/controllers/activity.dart';
import 'package:test_pt_kb_insurance/controllers/attendance.dart';
import 'package:test_pt_kb_insurance/models/activity.dart';
import 'package:test_pt_kb_insurance/models/categories.dart';
import 'package:test_pt_kb_insurance/widgets/button.dart';
import 'package:test_pt_kb_insurance/widgets/group_text_column.dart';
import 'package:test_pt_kb_insurance/widgets/group_text_column_list.dart';
import 'package:test_pt_kb_insurance/widgets/list_data.dart';
import 'package:test_pt_kb_insurance/widgets/list_date_activities.dart';
import 'package:test_pt_kb_insurance/widgets/not_found_data.dart';
import 'package:test_pt_kb_insurance/widgets/text_form_field.dart';
import 'package:test_pt_kb_insurance/widgets/text_form_field_icon.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var nikController = TextEditingController();
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  final ActivityController activityController = Get.put(ActivityController());
  var tempdate = "";
  var tempdateDeadline = "";
  var homeTime = TimeOfDay(hour: 8, minute: 30);

  var format = DateFormat("HH:mm");

  var endTime = TimeOfDay(hour: 17, minute: 30);
  CategoriesModel? a;

  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      activityController.fetchAllActivity();
      activityController.fetchAllCategories();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsApp.baseColor,
        onPressed: () {
          modalAtt(context: context, id: "0");
          // Add your onPressed code here!
        },
        icon: const Icon(Icons.add),
        label: TextLabel(
          text: "Activity",
          color: ColorsApp.white,
        ),
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorsApp.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: ColorsApp.decoration,
        ),
        title: TextLabel(
          text: "Activity",
          color: ColorsApp.white,
          font: FontApp.interBold,
        ),
      ),
      body: Container(
        width: SizeApp.width,
        height: SizeApp.height,
        child: Obx(() {
          return activityController.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : activityController.activities.length > 0
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            activityController.activities.length, (index) {
                          var data = activityController.activities[index];

                          return Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: ListDataActivities(
                                title: data.nik,
                                subTitle: data.activity,
                                index: index,
                                isOpen: data.isOpen ?? false,
                                onTapEdit: () {
                                  activityController.dateCtr.text =
                                      data.actDate;
                                  activityController.deadlineCtr.text =
                                      data.deadline;
                                  activityController.clockInCtr.text =
                                      data.timeIn;
                                  activityController.clockInCtr.text =
                                      data.timeOut;
                                  activityController.actiivity.text =
                                      data.activity;
                                  activityController.remark.text = data.remark;
                                  modalAtt(
                                      context: context,
                                      id: data.nik.toString());
                                },
                                onTapDelete: null,
                                widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GroupTextColumn(
                                      title: "Nik",
                                      subTitle: data.nik,
                                    ),
                                    GroupTextColumn(
                                      title: "Activity",
                                      subTitle: data.activity,
                                    ),
                                    GroupTextColumn(
                                      title: "Active Date",
                                      subTitle: data.actDate,
                                    ),
                                    GroupTextColumn(
                                      title: "Deadline",
                                      subTitle: data.deadline,
                                    ),
                                    GroupTextColumn(
                                      title: "Time In",
                                      subTitle: data.timeIn,
                                    ),
                                    GroupTextColumn(
                                      title: "Time Out",
                                      subTitle: data.timeOut,
                                    ),
                                    GroupTextColumn(
                                      title: "Remark",
                                      subTitle: data.remark,
                                    ),
                                  ],
                                ),
                              ));
                        }),
                      ),
                    )
                  : NotFoundData();
        }),
      ),
    );
  }

  modalAtt({context, id}) async {
    await showDialog(
      context: context,
      builder: (context) {
        // return Obx(() {
        return StatefulBuilder(builder: (context, setState) {
          return SimpleDialog(
            backgroundColor: ColorsApp.white,
            title: TextLabel(
              text: "Form Activity",
            ),
            children: [
              Divider(),
              Form(
                  // key: _formKey,
                  child: Column(
                children: [
                  TextFormApp(
                    title: "NIK",
                    controller: activityController.nikCtr,
                  ),
                  TextFormApp(
                    title: "Activity",
                    controller: activityController.actiivity,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Container(
                          child: Row(
                            children: const [
                              // Icon(
                              //   Icons.list,
                              //   size: 16,
                              // ),
                              // SizedBox(
                              //   width: 4,
                              // ),
                              Expanded(
                                child: Text(
                                  'Category',
                                  style: TextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        items: activityController.categories
                            .map((item) => DropdownMenuItem<CategoriesModel>(
                                  value: item,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      item.category,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: a,
                        onChanged: (value) {
                          setState(() {
                            a = value as CategoriesModel;
                            activityController.categoryModel!.value =
                                value as CategoriesModel;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: ColorsApp.white,
                        ),
                        buttonElevation: 0,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: MediaQuery.of(context).size.width - 20,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsApp.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(10),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(20, 0),
                      ),
                    ),
                  ),

                  // TextFormApp(
                  //     title: "name", controller: attendanceController.nameCtr),
                  InkWell(
                    onTap: () {
                      multipleDate(context, 'date');
                    },
                    child: TextFormApp(
                      enabled: false,
                      icon: Icon(
                        Icons.date_range,
                        color: ColorsApp.black.withOpacity(0.5),
                      ),
                      title: "Tanggal Kegiatan",
                      controller: activityController.dateCtr,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeApp.width / 2 - 40,
                        child: InkWell(
                          onTap: () async {
                            var startTime = await showTimePicker(
                              context: context,
                              initialTime: activityController.clockInCtr.text !=
                                      ""
                                  ? TimeOfDay(
                                      hour: int.parse(activityController
                                          .clockInCtr.text
                                          .split(":")[0]),
                                      minute: int.parse(activityController
                                          .clockInCtr.text
                                          .split(":")[1]))
                                  : TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.input,
                            );
                            if (startTime == null) return;

                            time = startTime;

                            activityController.clockInCtr.text =
                                "${time.hour}:${time.minute}";
                          },
                          child: TextFormApp(
                            enabled: false,
                            title: "jam masuk ",
                            controller: activityController.clockInCtr,
                          ),
                        ),
                      ),
                      Container(
                        width: SizeApp.width / 2 - 40,
                        child: InkWell(
                          onTap: () async {
                            var endTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  activityController.clockOutCtr.text != ""
                                      ? TimeOfDay(
                                          hour:
                                              int.parse(
                                                  activityController
                                                      .clockOutCtr.text
                                                      .split(":")[0]),
                                          minute: int.parse(activityController
                                              .clockOutCtr.text
                                              .split(":")[1]))
                                      : TimeOfDay.now(),
                              initialEntryMode: TimePickerEntryMode.input,
                            );
                            if (endTime == null) return;

                            time = endTime;

                            activityController.clockOutCtr.text =
                                "${time.hour}:${time.minute}";
                          },
                          child: TextFormApp(
                            enabled: false,
                            title: "Jam Pulang",
                            controller: activityController.clockOutCtr,
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      multipleDate(context, 'deadline');
                    },
                    child: TextFormApp(
                      enabled: false,
                      icon: Icon(
                        Icons.date_range,
                        color: ColorsApp.black.withOpacity(0.5),
                      ),
                      title: "Deadline",
                      controller: activityController.deadlineCtr,
                    ),
                  ),
                  TextFormApp(
                    title: "Remark",
                    controller: activityController.remark,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonApp(
                        title: "Cancel",
                        color: Colors.grey[300],
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(() {
                        return activityController.saveLoading.value == false
                            ? ButtonApp(
                                title: "Save",
                                color: ColorsApp.baseColor,
                                onTap: () {
                                  if (id != "0") {
                                    activityController.updateActivity();
                                  } else {
                                    activityController.saveActivity();
                                  }
                                },
                              )
                            : Container(
                                child: CircularProgressIndicator(),
                              );
                      })
                    ],
                  )
                ],
              ))
            ],
          );
        });
        // });
      },
    );
  }

  Future multipleDate(BuildContext context, status) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: ColorsApp.white,
              content: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.height / 2 + 50,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              "Date",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: "inter-medium",
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                //  Get.back();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                width: double.maxFinite,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        child: SingleChildScrollView(
                      child: Container(
                        child: status == "date"
                            ? SfDateRangePicker(
                                selectionTextStyle: TextStyle(
                                    fontFamily: "inter-regular", fontSize: 12),
                                onSelectionChanged: _onSelectionChanged,
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                initialDisplayDate: DateTime.parse(
                                    activityController.dateCtr.text
                                                .toString() !=
                                            ""
                                        ? activityController.dateCtr.text
                                            .toString()
                                        : DateTime.now().toString()),
                                initialSelectedDate: DateTime.parse(
                                    activityController.dateCtr.text
                                                .toString() !=
                                            ""
                                        ? activityController.dateCtr.text
                                            .toString()
                                        : DateTime.now().toString()),
                              )
                            : SfDateRangePicker(
                                selectionTextStyle: TextStyle(
                                    fontFamily: "inter-regular", fontSize: 12),
                                onSelectionChanged:
                                    _onSelectionChangedDateDealine,
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                initialDisplayDate: DateTime.parse(
                                    activityController.deadlineCtr.text
                                                .toString() !=
                                            ""
                                        ? activityController.deadlineCtr.text
                                            .toString()
                                        : DateTime.now().toString()),
                                initialSelectedDate: DateTime.parse(
                                    activityController.deadlineCtr.text
                                                .toString() !=
                                            ""
                                        ? activityController.deadlineCtr.text
                                            .toString()
                                        : DateTime.now().toString()),
                              ),
                      ),
                    )),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Get.back();
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: "Roboto-regular"),
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (status == "date") {
                                    activityController.dateCtr.text =
                                        tempdate.toString();
                                  } else {
                                    activityController.deadlineCtr.text =
                                        tempdateDeadline.toString();
                                  }
                                  Get.back();
                                  // setState(() {
                                  //   // selectedStartDate = tempSelectedStartDate;
                                  //   // selectedEndDate = tempSelectedEndDate;
                                  // });
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  // showModal();
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorsApp.baseColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                                ),
                                child: const Text(
                                  "Ok",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: "Roboto-regular"),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
      print("argas ${args.value}");
      tempdate = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(args.value.toString()));
    } else if (args.value is List<DateTime>) {
    } else {}
    // });
  }

  void _onSelectionChangedDateDealine(
      DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
      print("args ${args.value}");
      tempdateDeadline = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(args.value.toString()));
    } else if (args.value is List<DateTime>) {
    } else {}
    // });
  }
}
