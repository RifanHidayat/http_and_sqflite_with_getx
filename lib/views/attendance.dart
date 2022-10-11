import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sweetalertv2/sweetalertv2.dart';
import 'package:test_pt_kb_insurance/assets/colors.dart';
import 'package:test_pt_kb_insurance/assets/fonts.dart';
import 'package:test_pt_kb_insurance/assets/size.dart';
import 'package:test_pt_kb_insurance/controllers/attendance.dart';
import 'package:test_pt_kb_insurance/widgets/button.dart';
import 'package:test_pt_kb_insurance/widgets/group_text_column.dart';
import 'package:test_pt_kb_insurance/widgets/group_text_column_list.dart';
import 'package:test_pt_kb_insurance/widgets/list_data.dart';
import 'package:test_pt_kb_insurance/widgets/not_found_data.dart';
import 'package:test_pt_kb_insurance/widgets/text_form_field.dart';
import 'package:test_pt_kb_insurance/widgets/text_form_field_icon.dart';
import 'package:test_pt_kb_insurance/widgets/text_label.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatelessWidget {
  AttendancePage({super.key});

  var nikController = TextEditingController();
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  var tempdate = "";
  var homeTime = TimeOfDay(hour: 8, minute: 30);

  var format = DateFormat("HH:mm");

  var endTime = TimeOfDay(hour: 17, minute: 30);

  final _formKey = GlobalKey<FormState>();

  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      attendanceController.fetchAllAtt();
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
          text: "Attendance",
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
          text: "Attendance",
          color: ColorsApp.white,
          font: FontApp.interBold,
        ),
      ),
      body: Container(
        width: SizeApp.width,
        height: SizeApp.height,
        child: Obx(() {
          return attendanceController.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : attendanceController.atts.length > 0
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            attendanceController.atts.length, (index) {
                          var data = attendanceController.atts[index];
                          data!.description = [];

                          //  print('start ${startTime}');
                          var startTime = format.parse("08:30");
                          var endTime = format.parse("17:30");

                          // var currentStartTime = format.parse(data.clockIn);
                          // var currentEndtime = format.parse(data.clockOut);

                          // if (currentStartTime.isAfter(startTime)) {
                          //   Duration diff =
                          //       currentStartTime.difference(startTime);
                          //   data.description!.add(
                          //       "${data.name} telat ${diff.inMinutes} Menit");
                          // }
                          // if (currentEndtime.isBefore(endTime)) {
                          //   Duration diff = endTime.difference(currentEndtime);
                          //   data.description!.add(
                          //       "${data.name} Pulang ${diff.inMinutes} Menit lebih awal");
                          // }

                          return Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: ListData(
                                title: data.nik,
                                subTitle: data.name,
                                index: index,
                                isOpen: data.isOpen ?? false,
                                onTapEdit: () {
                                  attendanceController.nikCtr.text =
                                      data.nik.toString();
                                  attendanceController.nameCtr.text =
                                      data.name.toString();
                                  attendanceController.datectr.text =
                                      data.date.toString();
                                  attendanceController.clockInCtr.text =
                                      data.clockIn.toString();
                                  attendanceController.clockOutCtr.text =
                                      data.clockOut.toString();
                                  modalAtt(
                                      context: context, id: data.id.toString());
                                },
                                onTapDelete: () {
                                  
                                  SweetAlertV2.show(context,
                                      title: "Deleted !",
                                      subtitle: "Are you sure?",
                                      style: SweetAlertV2Style.confirm,
                                      showCancelButton: true,
                                      confirmButtonText: "Yes",
                                      onPress: (bool isConfirm) {
                                    if (isConfirm) {
                                      attendanceController
                                          .deleteAtt(data.id.toString());

                                      return false;
                                    } else {
                                      Get.back();
                                    }
                                    return false;
                                  });
                                },
                                widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GroupTextColumn(
                                      title: "Nik",
                                      subTitle: data.nik,
                                    ),
                                    GroupTextColumn(
                                      title: "Nama Karyawan",
                                      subTitle: data.name,
                                    ),
                                    GroupTextColumn(
                                      title: "Tanggal",
                                      subTitle: data.date,
                                    ),
                                    GroupTextColumn(
                                      title: "Jam Masuk",
                                      subTitle: data.clockIn,
                                    ),
                                    GroupTextColumn(
                                      title: "jam Pulang",
                                      subTitle: data.clockOut,
                                    ),
                                    GroupTextColumnList(
                                        title: "Keterangan",
                                        subTitle: data.description!.toList()),
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
              text: "Form Attendance",
            ),
            children: [
              Divider(),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormApp(
                        title: "NIK",
                        controller: attendanceController.nikCtr,
                      ),
                      TextFormApp(
                          title: "name",
                          controller: attendanceController.nameCtr),
                      InkWell(
                        onTap: () {
                          multipleDate(context);
                        },
                        child: TextFormApp(
                          enabled: false,
                          icon: Icon(
                            Icons.date_range,
                            color: ColorsApp.black.withOpacity(0.5),
                          ),
                          title: "Tanggal",
                          controller: attendanceController.datectr,
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
                                  initialTime:
                                      attendanceController.clockInCtr.text != ""
                                          ? TimeOfDay(
                                              hour: int.parse(
                                                  attendanceController
                                                      .clockInCtr.text
                                                      .split(":")[0]),
                                              minute: int.parse(
                                                  attendanceController
                                                      .clockInCtr.text
                                                      .split(":")[1]))
                                          : TimeOfDay.now(),
                                  initialEntryMode: TimePickerEntryMode.input,
                                );
                                if (startTime == null) return;

                                time = startTime;

                                attendanceController.clockInCtr.text =
                                    "${time.hour}:${time.minute}";
                              },
                              child: TextFormApp(
                                enabled: false,
                                title: "jam masuk ",
                                controller: attendanceController.clockInCtr,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeApp.width / 2 - 40,
                            child: InkWell(
                              onTap: () async {
                                var endTime = await showTimePicker(
                                  context: context,
                                  initialTime: attendanceController
                                              .clockOutCtr.text !=
                                          ""
                                      ? TimeOfDay(
                                          hour: int.parse(attendanceController
                                              .clockOutCtr.text
                                              .split(":")[0]),
                                          minute: int.parse(attendanceController
                                              .clockOutCtr.text
                                              .split(":")[1]))
                                      : TimeOfDay.now(),
                                  initialEntryMode: TimePickerEntryMode.input,
                                );
                                if (endTime == null) return;

                                time = endTime;

                                attendanceController.clockOutCtr.text =
                                    "${time.hour}:${time.minute}";
                              },
                              child: TextFormApp(
                                enabled: false,
                                title: "Jam Pulang",
                                controller: attendanceController.clockOutCtr,
                              ),
                            ),
                          ),
                        ],
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
                            return attendanceController.saveLoading.value ==
                                    false
                                ? ButtonApp(
                                    title: "Save",
                                    color: ColorsApp.baseColor,
                                    onTap: () {
                                      if (id != "0") {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          attendanceController.updateAtt(
                                              context, id);
                                        }
                                      } else {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          attendanceController.saveAtt(context);
                                        }
                                        //
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

  Future multipleDate(BuildContext context) {
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
                        child: SfDateRangePicker(
                          selectionTextStyle: TextStyle(
                              fontFamily: "inter-regular", fontSize: 12),
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.single,
                          initialDisplayDate: DateTime.parse(
                              attendanceController.datectr.text.toString() != ""
                                  ? attendanceController.datectr.text.toString()
                                  : DateTime.now().toString()),
                          initialSelectedDate: DateTime.parse(
                              attendanceController.datectr.text.toString() != ""
                                  ? attendanceController.datectr.text.toString()
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
                                  attendanceController.datectr.text =
                                      tempdate.toString();
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
    // setState(() {
    if (args.value is PickerDateRange) {
      // tempSelectedStartDate = args.value.startDate;
      // tempSelectedEndDate = args.value.endDate;

      // print(args.value.startDate);
      // print(args.value.endDate);
      //  tempdate = args.value.toString();
      // attendanceController.datectr.text = args.value.toString();

    } else if (args.value is DateTime) {
      print("args ${args.value}");
      tempdate = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(args.value.toString()));
    } else if (args.value is List<DateTime>) {
    } else {}
    // });
  }
}
