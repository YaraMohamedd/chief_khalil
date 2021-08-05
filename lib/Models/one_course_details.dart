// To parse this JSON data, do
//
//     final coursesModel = coursesModelFromJson(jsonString);

import 'dart:convert';

CoursesModel coursesModelFromJson(String str) => CoursesModel.fromJson(json.decode(str));

String coursesModelToJson(CoursesModel data) => json.encode(data.toJson());
class CoursesModel {
  CoursesModel({
    this.status,
    this.msg,
    this.data,
  });

  bool status;
  String msg;
  Data data;

  factory CoursesModel.fromJson(Map<String, dynamic> json) => CoursesModel(
    status: json["status"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.courses,
  });

  Courses courses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    courses: Courses.fromJson(json["courses"]),
  );

  Map<String, dynamic> toJson() => {
    "courses": courses.toJson(),
  };
}

class Courses {
  Courses({
    this.id,
    this.nameAr,
    this.nameEn,
    this.detailsAr,
    this.detailsEn,
    this.numberOfLessons,
    this.categoryId,
    this.chiefId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String nameAr;
  String nameEn;
  String detailsAr;
  String detailsEn;
  String numberOfLessons;
  String categoryId;
  String chiefId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    detailsAr: json["details_ar"],
    detailsEn: json["details_en"],
    numberOfLessons: json["number_of_lessons"],
    categoryId: json["category_id"],
    chiefId: json["chief_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "details_ar": detailsAr,
    "details_en": detailsEn,
    "number_of_lessons": numberOfLessons,
    "category_id": categoryId,
    "chief_id": chiefId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
