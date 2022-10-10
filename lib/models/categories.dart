// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    this.seq,
    this.kdDept,
    this.category,
  });

  var seq;
  var kdDept;
  var category;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        seq: json["Seq"] ?? "",
        kdDept: json["KdDept"] ?? "",
        category: json["Category"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Seq": seq,
        "KdDept": kdDept,
        "Category": category,
      };
  static List<CategoriesModel> fromJsonToList(List data) {
    return List<CategoriesModel>.from(data.map(
      (item) => CategoriesModel.fromJson(item),
    ));
  }
}
