class Cheif {
  Data data;

  Cheif({this.data});

  Cheif.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}
class Data {
  List<Chiefs> chiefs;

  Data({this.chiefs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['chiefs'] != null) {
      chiefs = new List<Chiefs>();
      json['chiefs'].forEach((v) {
        chiefs.add(new Chiefs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chiefs != null) {
      data['chiefs'] = this.chiefs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chiefs {
  int id;
  String fname;
  String lname;
  String gender;
  String email;
  String phone;
  String image;
  String biographyEn;
  String biographyAr;
  String professionalLifeEn;
  String professionalLifeAr;
  String instagram;
  String twitter;
  String facebook;
  String snapchat;
  String state;
  String createdAt;
  String updatedAt;

  Chiefs(
      {this.id,
        this.fname,
        this.lname,
        this.gender,
        this.email,
        this.phone,
        this.image,
        this.biographyEn,
        this.biographyAr,
        this.professionalLifeEn,
        this.professionalLifeAr,
        this.instagram,
        this.twitter,
        this.facebook,
        this.snapchat,
        this.state,
        this.createdAt,
        this.updatedAt});

  Chiefs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    biographyEn = json['biography_en'];
    biographyAr = json['biography_ar'];
    professionalLifeEn = json['professionalLife_en'];
    professionalLifeAr = json['professionalLife_ar'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    snapchat = json['snapchat'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['biography_en'] = this.biographyEn;
    data['biography_ar'] = this.biographyAr;
    data['professionalLife_en'] = this.professionalLifeEn;
    data['professionalLife_ar'] = this.professionalLifeAr;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['facebook'] = this.facebook;
    data['snapchat'] = this.snapchat;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
