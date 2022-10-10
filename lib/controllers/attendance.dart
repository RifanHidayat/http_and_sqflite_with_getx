import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:test_pt_kb_insurance/models/attendance.dart';
import 'package:test_pt_kb_insurance/services/databse_helper.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool saveLoading = false.obs;

  DatabaseHelper db = new DatabaseHelper();
  RxList<AttendanceModel> atts = <AttendanceModel>[].obs;
  var nikCtr = TextEditingController();
  var nameCtr = TextEditingController();
  var datectr = TextEditingController();
  var clockInCtr = TextEditingController();
  var clockOutCtr = TextEditingController();

  

  void fetchAllAtt() {
    atts.value = [];
    print("dgs");
    isLoading.value = true;
    db.getAtt().then((value) {
     
      atts.value = AttendanceModel.fromJsonToList(value);

      isLoading.value = false;
    });
  }

  void saveAtt(context) {
    saveLoading.value = true;
    db
        .saveAtt(
            context: context,
            att: AttendanceModel(
                nik: nikCtr.text,
                date: datectr.text,
                clockIn: clockInCtr.text,
                clockOut: clockOutCtr.text,
                name: nameCtr.text))
        .then((_) {
      nameCtr.clear();
      datectr.clear();
      clockInCtr.clear();
      clockOutCtr.clear();
      nikCtr.clear();

      Get.snackbar('Message', 'Successfully created',
          snackPosition: SnackPosition.BOTTOM);
      Navigator.pop(context, "save");
      fetchAllAtt();
      saveLoading.value = false;
    });
  }

  void deleteAtt(id) {
    db.deleteAtt(id).then((value) {
      Get.snackbar('Message', 'Successfully deleted',
          snackPosition: SnackPosition.BOTTOM);
    });
    Get.back();
    fetchAllAtt();
  }

  void updateAtt(context, id) {
    saveLoading.value = true;
    db
        .updateAtt(AttendanceModel.fromJson({
      'id': id,
      'nik': nikCtr.text.toString(),
      'date': datectr.text.toString(),
      'clock_in': clockInCtr.text.toString(),
      'clock_out': clockOutCtr.text.toString(),
      'name': nameCtr.text.toString()
    }))
        .then((value) {
      nameCtr.clear();
      datectr.clear();
      clockInCtr.clear();
      clockOutCtr.clear();
      nikCtr.clear();

      Get.snackbar('Message', 'Successfully updated',
          snackPosition: SnackPosition.BOTTOM);
      Navigator.pop(context, "update");
      fetchAllAtt();
      saveLoading.value = false;
    });
  }
}
