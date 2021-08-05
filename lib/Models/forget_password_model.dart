class ForgetRequestModel {
  String email;

  ForgetRequestModel({this.email});

  ForgetRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}

class ForgetResponseModel {
  bool status;
  String msg;
  String verification_code;

  ForgetResponseModel({this.status, this.msg,this.verification_code});

  ForgetResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    verification_code = json['verification_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['verification_code'] = this.verification_code;
    return data;
  }
}