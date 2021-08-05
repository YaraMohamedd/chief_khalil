class LoginModel {
  bool status;
  String msg;
  Data data;

  LoginModel({this.status, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Client client;

  Data({this.client});

  Data.fromJson(Map<String, dynamic> json) {
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    return data;
  }
}

class Client {
  int id;
  String fname;
  String lname;
  String email;
  Null emailVerifiedAt;
  String phone;
  String countryCode;
  String code;
  String active;
  String rememberToken;
  String remember_Token;
  String gender;
  String packageId;
  String state;
  String endDateSubscripe;
  String image;
  String createdAt;
  String updatedAt;

  Client(
      {this.id,
        this.fname,
        this.lname,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.countryCode,
        this.code,
        this.active,
        this.rememberToken,
        this.remember_Token,
        this.gender,
        this.packageId,
        this.state,
        this.endDateSubscripe,
        this.image,
        this.createdAt,
        this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    code = json['code'];
    active = json['active'];
    rememberToken = json['rememberToken'];
    remember_Token = json['remember_token'];
    gender = json['gender'];
    packageId = json['package_id'];
    state = json['state'];
    endDateSubscripe = json['endDateSubscripe'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['countryCode'] = this.countryCode;
    data['code'] = this.code;
    data['active'] = this.active;
    data['rememberToken'] = this.rememberToken;
    data['remember_token'] = this.remember_Token;
    data['gender'] = this.gender;
    data['package_id'] = this.packageId;
    data['state'] = this.state;
    data['endDateSubscripe'] = this.endDateSubscripe;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
