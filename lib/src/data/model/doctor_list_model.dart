// To parse this JSON data, do
//
//     final doctorList = doctorListFromJson(jsonString);

import 'dart:convert';

List<DoctorList> doctorListFromJson(String str) => List<DoctorList>.from(json.decode(str).map((x) => DoctorList.fromJson(x)));

String doctorListToJson(List<DoctorList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorList {
  DoctorList({
    this.id,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.favorite,
    this.primaryContactNo,
    this.rating,
    this.emailAddress,
    this.qualification,
    this.description,
    this.specialization,
    this.languagesKnown,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  bool? favorite;
  String? primaryContactNo;
  String? rating;
  String? emailAddress;
  String? qualification;
  String? description;
  String? specialization;
  String? languagesKnown;

  factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    profilePic: json["profile_pic"],
    favorite: json["favorite"],
    primaryContactNo: json["primary_contact_no"],
    rating: json["rating"],
    emailAddress: json["email_address"],
    qualification: json["qualification"],
    description: json["description"],
    specialization: json["specialization"],
    languagesKnown: json["languagesKnown"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "profile_pic": profilePic,
    "favorite": favorite,
    "primary_contact_no": primaryContactNo,
    "rating": rating,
    "email_address": emailAddress,
    "qualification": qualification,
    "description": description,
    "specialization":specialization,
    "languagesKnown": languagesKnown,
  };
}

