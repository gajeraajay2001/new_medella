import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';

import '../../main.dart';
import '../constants/constants.dart';
import '../routes/app_pages.dart';

Future<void> verifyMobileNumber(
    {required BuildContext context,
    required String mobileNumber,
    required String route}) async {
  getIt<CustomDialogs>().showCircularDialog(context);
  FirebaseAuth auth = FirebaseAuth.instance;
  await FirebaseAuth.instance
      .verifyPhoneNumber(
    phoneNumber: '+91$mobileNumber',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The provided phone number is not valid."),
          duration: Duration(milliseconds: 500),
        ));

        print('The provided phone number is not valid.');
      }
      getIt<CustomDialogs>().hideCircularDialog(context);
    },
    forceResendingToken:
        (isNullEmptyOrFalse(box.read(ArgumentConstant.resendToken)))
            ? null
            : box.read(ArgumentConstant.resendToken),
    codeSent: (String verificationId, int? resendToken) async {
      getIt<CustomDialogs>().hideCircularDialog(context);
      box.write(ArgumentConstant.verificationId, verificationId);
      box.write(ArgumentConstant.resendToken, resendToken);
      if (isNullEmptyOrFalse(route)) {
      } else {
        Get.toNamed(route);
      }
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  )
      .catchError((error) {
    getIt<CustomDialogs>().hideCircularDialog(context);
  });
}

Widget getButton({
  double height = 60,
  double width = 335,
  String title = "",
  double borderRadius = 10,
  Color color = Colors.white,
  Color borderColor = Colors.transparent,
  double fontSize = 20,
  Color? backColor,
}) {
  return Container(
    height: MySize.getHeight(height),
    width: MySize.getWidth(width),
    decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color:
            (isNullEmptyOrFalse(backColor)) ? appTheme.primaryTheme : backColor,
        borderRadius: BorderRadius.circular(borderRadius)),
    alignment: Alignment.center,
    child: Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: MySize.getHeight(fontSize),
      ),
    ),
  );
}
