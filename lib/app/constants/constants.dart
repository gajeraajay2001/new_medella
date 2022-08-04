import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';

const imagePath = "assets/images/";
const baseUrl = "https://backend.medella.org/api/v1";

class ApiConstant {
  static const verifyUser = "/users/verify";
  static const userSignUp = "/users/signup";
  static const getHospitalList = "/hospitals";
  static const addHospital = "/users/hospitals";
  static const getUserProfile = "/users/profile";
}

class ArgumentConstant {
  //signUP
  static String verificationId = "verificationId";
  static String token = "token";
  static String resendToken = "resendToken";
  static String mobileNumber = "mobileNumber";
  static String firebaseToken = "firebaseToken";

  //SignUP01
  static String firstName = "firstName";
  static String dob = "dob";
  static String ssn = "ssn";
  static String gender = "gender";
  static String pickedIdFile = "pickedIdFile";
  static String pickedIdFilePath = "pickedIdFilePath";
}

Widget MyText(BuildContext context, String label, TextAlign alignment,
    Color clr, double size, FontWeight weight,
    {int? maxLines}) {
  return Text(
    label,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: size,
      color: clr,
      fontWeight: weight,
      fontFamily: "design.graffiti.comicsansms",
      letterSpacing: 0,
    ),
  );
}
