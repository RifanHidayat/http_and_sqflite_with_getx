import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:test_pt_kb_insurance/models/activity.dart';
import 'package:http/http.dart' as http;
import 'package:test_pt_kb_insurance/models/categories.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool saveLoading = false.obs;
  RxList<ActivityModel> activities = <ActivityModel>[].obs;
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;

  Rx<CategoriesModel>? categoryModel = CategoriesModel().obs;

  final baseapi = "http://dev.kbinsure.co.id/intranet";
  var nikCtr = TextEditingController();

  var dateCtr = TextEditingController();
  var deadlineCtr = TextEditingController();
  var clockInCtr = TextEditingController();
  var clockOutCtr = TextEditingController();
  var actiivity = TextEditingController();
  var remark = TextEditingController();

  fetchAllActivity() async {
    isLoading.value = true;
    var body = jsonEncode({
      "UserID": "intranet",
      "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
      "Token":
          "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
      "GroupCD": "adm",
      "RequestData": {
        "NIK": "11111111",
        "FromDate": "",
        "ToDate": "",
        "Status": "N"
      }
    });

    var response =
        await http.post(Uri.parse("${baseapi}/activity?act=act_s"), body: body);
    final resp = jsonDecode(response.body);
    print("data ${resp['data']}");

    if (response.statusCode == 200) {
      activities.value = ActivityModel.fromJsonToList(resp['data']);
      print("dasfs");

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  fetchAllCategories() async {
    //isLoading.value = true;
    var body = jsonEncode({
      "UserID": "intranet",
      "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
      "Token":
          "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
      "GroupCD": "ADM",
      "RequestData": {
        "Type": "Dropdown",
        "TxtSearch": "Category",
        "KdDept": "04"
      }
    });

    var response = await http.post(
        Uri.parse("http://dev.kbinsure.co.id/intranet/global?act=act_e"),
        body: body);
    final resp = jsonDecode(response.body);
    print("dataa ${resp['data']}");

    if (response.statusCode == 200) {
      categories.value = CategoriesModel.fromJsonToList(resp['data']);
      print("dasfs${resp['data']}");

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  saveActivity() async {
    saveLoading.value = true;
    var body = jsonEncode({
      "UserID": "intranet",
      "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
      "Token":
          "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
      "GroupCD": "adm",
      "RequestData": {
        "NIK": nikCtr.text,
        "KdDept": "04",
        "ActDate": dateCtr.text,
        "TimeIn": clockInCtr.text,
        "TimeOut": clockOutCtr.text,
        "CategorySeq": categoryModel!.value.seq,
        "Activity": actiivity.text,
        "Deadline": deadlineCtr.text,
        "Remark": remark.text,
        "SavedBy": nikCtr.text
      }
    });

    var response = await http
        .post(Uri.parse("${baseapi}/activity?act=act_s_add"), body: body);
    final resp = jsonDecode(response.body);
    print(resp);

    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar('Message', resp['message'],
          snackPosition: SnackPosition.BOTTOM);

      dateCtr.clear();
      deadlineCtr.clear();
      clockInCtr.clear();
      clockInCtr.clear();
      actiivity.clear();
      remark.clear();
      fetchAllActivity();

      saveLoading.value = false;
    } else {
      saveLoading.value = false;
    }
  }

  updateActivity() async {
    saveLoading.value = true;
    var body = jsonEncode({
      "UserID": "intranet",
      "Password": "MmMyZjZmZTgyNzc0MjNlNGQyZTNkMzk0ZmU0MDhiMjM=",
      "Token":
          "Y2Q3MDFhODZiYWQwMDE0OGM1MTM1ZWM2MTA2YjEyMTYxNGNjZmE2ODVkODQyMzExM2UwNzk3ZWZhZTFhMzA5Mg==",
      "GroupCD": "adm",
      "RequestData": {
        "Seq": "0",
        "NIK": nikCtr.text,
        "KdDept": "00",
        "ActDate": dateCtr.text,
        "TimeIn": clockInCtr.text,
        "TimeOut": clockOutCtr.text,
        "CategorySeq": categoryModel!.value.seq,
        "Activity": actiivity.text,
        "Deadline": deadlineCtr.text,
        "Remark": remark.text,
        "Status": "D",
        "SavedBy": nikCtr.text
      }
    });

    var response = await http
        .post(Uri.parse("${baseapi}/activity?act=act_s_edt"), body: body);
    final resp = jsonDecode(response.body);
    print(resp);

    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar('Message', resp['message'],
          snackPosition: SnackPosition.BOTTOM);

      dateCtr.clear();
      deadlineCtr.clear();
      clockInCtr.clear();
      clockInCtr.clear();
      actiivity.clear();
      remark.clear();
      fetchAllActivity();

      saveLoading.value = false;
    } else {
      saveLoading.value = false;
    }
  }
}
