const imagePath = "assets/images/";
const baseUrl = "https://backend.medella.org/api/v1";

class ApiConstant {
  static const verifyUser = "/users/verify";
  static const userSignUp = "/users/signup";
  static const getHospitalList = "/hospitals";
  static const addHospital = "/users/hospitals";
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
