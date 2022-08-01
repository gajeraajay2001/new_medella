import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:pinput/pinput.dart';
import '../../../../main.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/utilities.dart';
import '../controllers/otp_screen_controller.dart';

class OtpScreenView extends GetWidget<OtpScreenController> {
  @override
  Widget build(BuildContext context) {
    if (controller.isTimerStarted.isFalse) {
      controller.startTimer();
    }
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Space.height(15),
                        Padding(
                          padding: EdgeInsets.only(left: MySize.getWidth(20)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: MySize.getHeight(35),
                              ),
                            ),
                          ),
                        ),
                        Space.height(30),
                        Container(
                            height: MySize.getHeight(209),
                            width: MySize.getWidth(172),
                            child:
                                Image.asset("assets/images/medella_logo.png")),
                        Space.height(35),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Hello, Welcome to ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: MySize.getHeight(24))),
                              TextSpan(
                                  text: "medella",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: appTheme.primaryTheme,
                                      fontSize: MySize.getHeight(24))),
                            ],
                          ),
                        ),
                        Space.height(4),
                        Text(
                          "Verification code",
                          style: TextStyle(
                              color: Color(0xff262626).withOpacity(0.5)),
                        ),
                        Space.height(21),
                        Container(
                          width: MySize.getWidth(275),
                          alignment: Alignment.center,
                          child: Pinput(
                            length: 6,
                            controller: controller.pinPutController,
                            separator: SizedBox(
                              width: MySize.getWidth(6),
                            ),
                            defaultPinTheme: controller.defaultPinTheme,
                          ),
                        ),
                        Spacing.height(25),
                        InkWell(
                            onTap: () async {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId:
                                              controller.verificationId,
                                          smsCode: controller
                                              .pinPutController.value.text))
                                  .then((value) async {
                                final user =
                                    await FirebaseAuth.instance.currentUser!;
                                final idToken = await user.getIdToken();
                                final token = idToken;
                                print("Firebase Token := ${token}");
                                if (!isNullEmptyOrFalse(token)) {
                                  controller.timerControl!.cancel();
                                  box.write(
                                      ArgumentConstant.firebaseToken, token);
                                  controller.callVerifyUserApi(
                                      context: context);
                                }
                                print(value);
                              }).catchError((e) {
                                print(e.toString());
                                Get.snackbar(
                                    "Invalid OTP", "Please provide right OTP",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.redAccent,
                                    borderRadius: 0,
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: EdgeInsets.zero);
                              });
                            },
                            child: getButton(title: "Verify")),
                        Space.height(20),
                        Container(
                          height: MySize.getHeight(46),
                          width: MySize.getWidth(46),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.primaryTheme.withOpacity(0.1),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            controller.seconds.value.toString(),
                            style: TextStyle(color: appTheme.primaryTheme),
                          ),
                        ),
                        Space.height(15),
                        InkWell(
                          onTap: (controller.isResendEnable.isFalse)
                              ? null
                              : () {
                                  verifyMobileNumber(
                                      mobileNumber: controller.mobileNumber,
                                      route: "",
                                      context: context);
                                },
                          child: Container(
                            height: MySize.getHeight(50),
                            width: MySize.getWidth(150),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MySize.getHeight(10)),
                              border: Border.all(color: appTheme.grayTheme),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                  color: (controller.isResendEnable.isFalse)
                                      ? appTheme.redColor.withOpacity(0.5)
                                      : appTheme.redColor,
                                  fontSize: MySize.getHeight(18),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
