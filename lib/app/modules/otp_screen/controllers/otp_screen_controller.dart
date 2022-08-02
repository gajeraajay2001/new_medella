import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:pinput/pinput.dart';
import '../../../../main.dart';
import '../../../data/NetworkClient.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/progress_dialog_utils.dart';

class OtpScreenController extends GetxController {
  String verificationId = "";
  String resendToken = "";
  String mobileNumber = "";
  Timer? timerControl;
  RxBool isTimerStarted = false.obs;
  RxBool isResendEnable = false.obs;
  TextEditingController pinPutController = TextEditingController();
  RxInt seconds = 30.obs;
  final defaultPinTheme = PinTheme(
    width: MySize.getWidth(70),
    height: MySize.getHeight(50),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: appTheme.grayTheme,
      border: Border.all(color: appTheme.grayTheme),
      borderRadius: BorderRadius.circular(5),
    ),
  );
  @override
  void onInit() {
    if (box.read(ArgumentConstant.verificationId) != null) {
      verificationId = box.read(ArgumentConstant.verificationId).toString();
    }
    if (box.read(ArgumentConstant.resendToken) != null) {
      resendToken = box.read(ArgumentConstant.resendToken).toString();
    }
    if (box.read(ArgumentConstant.mobileNumber) != null) {
      mobileNumber = box.read(ArgumentConstant.mobileNumber).toString();
    }

    super.onInit();
  }

  void startTimer() {
    timerControl = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print("Test := ${seconds.value}");
      if (seconds.value != 0) {
        isTimerStarted.value = true;
        seconds.value--;
      } else {
        seconds.value == 0;
        isResendEnable.value = true;
        timerControl!.cancel();
      }
    });
  }

  callVerifyUserApi({required BuildContext context}) {
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["firebase_token"] = box.read(ArgumentConstant.firebaseToken);
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.verifyUser,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);

        if (response["status"] == "success") {
          if (response["advisor"] == "new") {
            if (!isNullEmptyOrFalse(response["token"])) {
              box.write(ArgumentConstant.token, response["token"]);
              Get.offAllNamed(Routes.NEW_SIGN_UP);
            }
          } else {
            if (!isNullEmptyOrFalse(response["token"])) {
              box.write(ArgumentConstant.token, response["token"]);
              Get.offAllNamed(Routes.HOME);
            }
          }
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);

        getIt<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        print(" error");
      },
    );
  }

  @override
  void dispose() {
    timerControl!.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
