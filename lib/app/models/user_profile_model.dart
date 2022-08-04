class UserProfileModel {
  int? status;
  Data? data;

  UserProfileModel({this.status, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserProfileData? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserProfileData {
  int? id;
  int? medellaCode;
  String? userName;
  String? dob;
  int? mobile;
  String? socialSecurity;
  String? userIdCard;
  String? userImage;
  String? country;
  String? state;
  String? city;
  bool? isApproved;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? hospitalId;

  UserProfileData(
      {this.id,
      this.medellaCode,
      this.userName,
      this.dob,
      this.mobile,
      this.socialSecurity,
      this.userIdCard,
      this.userImage,
      this.country,
      this.state,
      this.city,
      this.isApproved,
      this.uid,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.hospitalId});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medellaCode = json['medellaCode'];
    userName = json['userName'];
    dob = json['dob'];
    mobile = json['mobile'];
    socialSecurity = json['socialSecurity'];
    userIdCard = json['userIdCard'];
    userImage = json['userImage'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    isApproved = json['isApproved'];
    uid = json['uid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    hospitalId = json['HospitalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medellaCode'] = this.medellaCode;
    data['userName'] = this.userName;
    data['dob'] = this.dob;
    data['mobile'] = this.mobile;
    data['socialSecurity'] = this.socialSecurity;
    data['userIdCard'] = this.userIdCard;
    data['userImage'] = this.userImage;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['isApproved'] = this.isApproved;
    data['uid'] = this.uid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['HospitalId'] = this.hospitalId;
    return data;
  }
}
