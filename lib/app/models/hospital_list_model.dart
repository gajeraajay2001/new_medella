import 'package:get/get.dart';

class HospitalListModel {
  int? status;
  int? results;
  Data? data;

  HospitalListModel({this.status, this.results, this.data});

  HospitalListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<HospitalData>? hospitalData = [];

  Data({this.hospitalData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        hospitalData!.add(new HospitalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospitalData != null) {
      data['data'] = this.hospitalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HospitalData {
  int? id;
  String? name;
  String? email;
  String? password;
  String? type;
  String? notes;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  RxBool? isSelected;

  HospitalData(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.type,
      this.notes,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.isSelected});

  HospitalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    notes = json['notes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    isSelected = false.obs;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['notes'] = this.notes;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
