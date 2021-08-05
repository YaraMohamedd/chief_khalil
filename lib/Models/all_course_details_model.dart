class AllCourseDeatailsModel {
  bool status;
  Msg msg;
  Data data;

  AllCourseDeatailsModel({this.status, this.msg, this.data});

  AllCourseDeatailsModel.fromJson(Map<String, dynamic> json) {
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
  int count;

  Msg({this.count});

  Msg.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Data {
  List<Courses> courses;

  Data({this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = new List<Courses>();
      json['courses'].forEach((v) {
        courses.add(new Courses.fromJson(v));
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

class Courses {
  int id;
  String nameAr;
  String nameEn;
  String detailsAr;
  String detailsEn;
  int numberOfLessons;
  int categoryId;
  int chiefId;
  String image;
  String createdAt;
  String updatedAt;

  Courses(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.detailsAr,
        this.detailsEn,
        this.numberOfLessons,
        this.categoryId,
        this.chiefId,
        this.image,
        this.createdAt,
        this.updatedAt});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    detailsAr = json['details_ar'];
    detailsEn = json['details_en'];
    numberOfLessons = json['number_of_lessons'];
    categoryId = json['category_id'];
    chiefId = json['chief_id'];
    image = json['image'];
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
    data['number_of_lessons'] = this.numberOfLessons;
    data['category_id'] = this.categoryId;
    data['chief_id'] = this.chiefId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
