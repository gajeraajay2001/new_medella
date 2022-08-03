import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/data/NetworkClient.dart';
import 'package:medella_new/app/models/sign_up_model.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';
import 'package:medella_new/main.dart';
import 'package:path/path.dart' as p;

import '../../../routes/app_pages.dart';

class NewSignUp2Controller extends GetxController {
  String nameController = "";
  String dateController = "";
  String securityNumberController = "";
  String uploadIdController = "";
  String gender = "Male";
  RxString countryValue = "Select Country".obs;
  RxString stateValue = "Select State".obs;
  RxString cityValue = "Select City".obs;
  RxBool isFilePicked = false.obs;
  RxBool checkBox1 = false.obs;
  Rx<File>? pickedFile;
  File? pickedIdFile;
  String pickedIdFilePath = "";

  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments)) {
      nameController = Get.arguments[ArgumentConstant.firstName];
      dateController = Get.arguments[ArgumentConstant.dob];
      securityNumberController = Get.arguments[ArgumentConstant.ssn];
      gender = Get.arguments[ArgumentConstant.gender];
      pickedIdFile = Get.arguments[ArgumentConstant.pickedIdFile];
      pickedIdFilePath = Get.arguments[ArgumentConstant.pickedIdFilePath];
    }
    super.onInit();
  }

  signUpUserApi({required BuildContext context}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["userName"] = nameController;
    dict["dob"] = dateController;
    dict["socialSecurity"] = securityNumberController;
    dict["country"] = countryValue.value;
    dict["state"] = stateValue.value;
    dict["city"] = cityValue.value;

    if (!isNullEmptyOrFalse(pickedFile)) {
      String fileName = p.basenameWithoutExtension(pickedFile!.value.path);
      dict["userImage"] = await MultipartFile.fromFile(pickedFile!.value.path,
          filename: fileName);
    } else {
      dict["userImage"] = "";
    }
    if (!isNullEmptyOrFalse(pickedIdFile)) {
      // String fileName = p.basenameWithoutExtension(pickedIdFile!.path);
      dict["userIdCard"] = await MultipartFile.fromFile(pickedIdFile!.path,
          filename: pickedIdFilePath);
    } else {
      dict["userIdCard"] = "";
    }

    FormData formData = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.userSignUp,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);

        if (response["status"] == 200) {
          SignUpModel res = SignUpModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.token)) {
            box.write(ArgumentConstant.token, res.token);
            Get.toNamed(Routes.SELECT_HOSPITAL_SCREEN);
            // Get.offAllNamed(Routes.HOME);
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
