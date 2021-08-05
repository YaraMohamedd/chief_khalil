import 'dart:convert';

class CourselessonsModel {
  bool status;
  Msg msg;
  Data data;
  CourselessonsModel({this.status, this.msg, this.data});
  CourselessonsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'] != null ? new Msg.fromJson(json['msg']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.msg != null) {
      data['msg'] = this.msg.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
class Msg {
  int lessons;

  Msg({this.lessons});

  Msg.fromJson(Map<String, dynamic> json) {
    lessons = json['lessons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lessons'] = this.lessons;
    return data;
  }
}

class Data {
  List<Coursesss> courses;

  Data({this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = new List<Coursesss>();
      json['courses'].forEach((v) {
        courses.add(new Coursesss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coursesss {
  int id;
  String nameAr;
  String nameEn;
  String detailsAr;
  String detailsEn;
  Object url;
  Object image;
  String lessonNumber;
  String courseId;
  String createdAt;
  String updatedAt;

  Coursesss(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.detailsAr,
        this.detailsEn,
        this.url,
        this.image,
        this.lessonNumber,
        this.courseId,
        this.createdAt,
        this.updatedAt});

  Coursesss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    detailsAr = json['details_ar'];
    detailsEn = json['details_en'];
    url = json['url'];
    image = json['image'];
    lessonNumber = json['lesson_number'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['details_ar'] = this.detailsAr;
    data['details_en'] = this.detailsEn;
    data['url'] = this.url;
    data['image'] = this.image;
    data['lesson_number'] = this.lessonNumber;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
CourselessonsModel courseModelFromJson(String str) => CourselessonsModel.fromJson(json.decode(str));

String courseModelToJson(CourselessonsModel data) => json.encode(data.toJson());