class RegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String passwordConfirmation;
  String birthDate;
  String jobTitle;
  String city;
  String country;
  String gender;

  RegistrationRequest(
      {this.name,
        this.email,
        this.phone,
        this.password,
        this.passwordConfirmation,
        this.birthDate,
        this.jobTitle,
        this.city,
        this.country,
        this.gender});

  RegistrationRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    birthDate = json['birthDate'];
    jobTitle = json['jobTitle'];
    city = json['city'];
    country = json['country'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    data['birthDate'] = this.birthDate;
    data['jobTitle'] = this.jobTitle;
    data['city'] = this.city;
    data['country'] = this.country;
    data['gender'] = this.gender;
    return data;
  }
}

class RegistrationResponse {
  bool status;
  String msg;
  Data data;

  RegistrationResponse({this.status, this.msg, this.data});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
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
  String name;
  String email;
  String phone;
  String birthDate;
  String gender;
  String jobTitle;
  String city;
  String country;
  int type;
  Null coverImage;
  String verificationCode;
  int id;

  Client(
      {this.name,
        this.email,
        this.phone,
        this.birthDate,
        this.gender,
        this.jobTitle,
        this.city,
        this.country,
        this.type,
        this.coverImage,
        this.verificationCode,
        this.id});

  Client.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    jobTitle = json['jobTitle'];
    city = json['city'];
    country = json['country'];
    type = json['type'];
    coverImage = json['cover_image'];
    verificationCode = json['verification_code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['jobTitle'] = this.jobTitle;
    data['city'] = this.city;
    data['country'] = this.country;
    data['type'] = this.type;
    data['cover_image'] = this.coverImage;
    data['verification_code'] = this.verificationCode;
    data['id'] = this.id;
    return data;
  }
}