class SignUpModel {
  int? status;
  String? token;
  Data? data;

  SignUpModel({this.status, this.token, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserData? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  bool? isApproved;
  int? id;
  String? userName;
  String? dob;
  String? socialSecurity;
  String? country;
  String? state;
  String? city;
  int? mobile;
  String? uid;
  String? userIdCard;
  String? userImage;
  int? medellaCode;
  String? updatedAt;
  String? createdAt;

  UserData(
      {this.isApproved,
      this.id,
      this.userName,
      this.dob,
      this.socialSecurity,
      this.country,
      this.state,
      this.city,
      this.mobile,
      this.uid,
      this.userIdCard,
      this.userImage,
      this.medellaCode,
      this.updatedAt,
      this.createdAt});

  UserData.fromJson(Map<String, dynamic> json) {
    isApproved = json['isApproved'];
    id = json['id'];
    userName = json['userName'];
    dob = json['dob'];
    socialSecurity = json['socialSecurity'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    mobile = json['mobile'];
    uid = json['uid'];
    userIdCard = json['userIdCard'];
    userImage = json['userImage'];
    medellaCode = json['medellaCode'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isApproved'] = this.isApproved;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['dob'] = this.dob;
    data['socialSecurity'] = this.socialSecurity;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['mobile'] = this.mobile;
    data['uid'] = this.uid;
    data['userIdCard'] = this.userIdCard;
    data['userImage'] = this.userImage;
    data['medellaCode'] = this.medellaCode;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
