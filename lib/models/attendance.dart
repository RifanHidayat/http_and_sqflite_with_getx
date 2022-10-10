// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceModel> activityModelFromJson(String str) =>
    List<AttendanceModel>.from(
        json.decode(str).map((x) => AttendanceModel.fromJson(x)));

String activityModelToJson(List<AttendanceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceModel {
  AttendanceModel(
      {this.nik,
      this.name,
      this.date,
      this.clockIn,
      this.clockOut,
      this.id,
      this.description,
      this.isOpen});

  var nik;
  var name;
  var date;
  var clockIn;
  var clockOut;
  var isOpen;
  var id;
  List<String>? description = [];

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
          name: json["name"] ?? "",
          nik: json["nik"] ?? "",
          date: json['date'] ?? "",
          clockIn: json['clock_in'] ?? "",
          id: json['id'],
          isOpen: json['is_open'] ?? false,
          description: json['description'] ?? [],
          clockOut: json['clock_out'] ?? "");

  Map<String, dynamic> toJson() => {
        "nik": nik,
        'date': date,
        'clock_in': clockIn,
        'clock_out': clockOut,
        'name': name,
      };
  Map<String, dynamic> toJsonUpdate() => {
        "id": id,
        "nik": nik,
        'date': date,
        'clock_in': clockIn,
        'clock_out': clockOut,
        'name': name,
      };
  static List<AttendanceModel> fromJsonToList(List data) {
    return List<AttendanceModel>.from(data.map(
      (item) => AttendanceModel.fromJson(item),
    ));
  }
}
