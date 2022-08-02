import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';
import '../../../../main.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 1), () {
      Get.offAllNamed(Routes.SIGN_SCREEN);
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
