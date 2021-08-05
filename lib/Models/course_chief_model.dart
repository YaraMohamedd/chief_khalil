// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CourseChiefModel chiefFromJson(String str) => CourseChiefModel.fromJson(json.decode(str));

String chiefToJson(CourseChiefModel data) => json.encode(data.toJson());

class CourseChiefModel {
  CourseChiefModel({
    this.status,
    this.msg,
    this.data,
  });

  bool status;
  Msg msg;
  Data data;

  factory CourseChiefModel.fromJson(Map<String, dynamic> json) => CourseChiefModel(
    status: json["status"],
    msg: Msg.fromJson(json["msg"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.courses,
  });

  List<CourseChief> courses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    courses: List<CourseChief>.from(json["courses"].map((x) => CourseChief.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class CourseChief {
  CourseChief({
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

  factory CourseChief.fromJson(Map<String, dynamic> json) => CourseChief(
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

class Msg {
  Msg({
    this.count,
  });

  int count;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}
