// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

List<ActivityModel> activityModelFromJson(String str) =>
    List<ActivityModel>.from(
        json.decode(str).map((x) => ActivityModel.fromJson(x)));

String activityModelToJson(List<ActivityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  ActivityModel({
    this.seq,
    this.nik,
    this.namaKaryawan,
    this.namaHead,
    this.kdDept,
    this.department,
    this.actDate,
    this.deadline,
    this.timeIn,
    this.timeOut,
    this.status,
    this.category,
    this.createdDate,
    this.activity,
    this.remark,
    this.isOpen
  });

  var seq;
  var nik;
  var namaKaryawan;
  var namaHead;
  var kdDept;
  var department;
  var actDate;
  var deadline;
  var timeIn;
  var timeOut;
  var status;
  var category;
  var createdDate;
  var activity;
  var remark;
  var isOpen;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        seq: json["Seq"] ?? "",
        nik: json["NIK"] ?? "",
        namaKaryawan: json["NamaKaryawan"] ?? "",
        namaHead: json["NamaHead"] ?? "",
        kdDept: json["KdDept"] ?? "",
        department: json["Department"] ?? "",
        actDate: json["ActDate"] ?? "",
        deadline: json["Deadline"] ?? "",
        timeIn: json["TimeIn"] ?? "",
        timeOut: json["TimeOut"] ?? "",
        status: json["Status"] ?? "",
        category: json["Category"] ?? "",
        createdDate: json["CreatedDate"] ?? "",
        activity: json["Activity"] ?? "",
        remark: json["Remark"] ?? "",
        isOpen: json['is_open']??false
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "NIK": nik,
        "NamaKaryawan": namaKaryawan,
        "NamaHead": namaHead,
        "KdDept": kdDept,
        "Department": department,
        "ActDate":
            "${actDate.year.toString().padLeft(4, '0')}-${actDate.month.toString().padLeft(2, '0')}-${actDate.day.toString().padLeft(2, '0')}",
        "Deadline":
            "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
        "TimeIn": timeIn,
        "TimeOut": timeOut,
        "Status": status,
        "Category": category,
        "CreatedDate": createdDate.toIso8601String(),
        "Activity": activity,
        "Remark": remark,
      };
  static List<ActivityModel> fromJsonToList(List data) {
    return List<ActivityModel>.from(data.map(
      (item) => ActivityModel.fromJson(item),
    ));
  }
}
