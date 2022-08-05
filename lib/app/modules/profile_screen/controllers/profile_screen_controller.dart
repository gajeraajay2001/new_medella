import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import '../../../../main.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import 'package:path/path.dart' as p;
import '../../../models/user_profile_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class ProfileScreenController extends GetxController {
  RxBool hasData = false.obs;
  RxBool isOpen = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<UserProfileData>? profileData;
  @override
  void onInit() {
    getUserProfileData(context: Get.context!);
    super.onInit();
  }

  getUserProfileData({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.getUserProfile,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;

        if (response["status"] == 200) {
          UserProfileModel res = UserProfileModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.data)) {
              profileData = res.data!.data!.obs;
              refresh();
            }
          }
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        hasData.value = true;

        getIt<CustomDialogs>()
            .getDialog(title: "Failed", desc: "Something went wrong.");
        print(" error");
      },
    );
  }

  updateProfile(
      {required BuildContext context, required File pickedFile}) async {
    getIt<CustomDialogs>().showCircularDialog(scaffoldKey.currentContext!);
    Map<String, dynamic> dict = {};
    if (!isNullEmptyOrFalse(pickedFile)) {
      String fileName = p.basenameWithoutExtension(pickedFile.path);
      dict["userImage"] =
          await MultipartFile.fromFile(pickedFile.path, filename: fileName);
    } else {
      dict["userImage"] = "";
    }
    FormData formData = FormData.fromMap(dict);
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.updateFiles,
      MethodType.Patch,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: formData,
      successCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(scaffoldKey.currentContext!);
        if (response["status"] == 200) {
          getUserProfileData(context: context);
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(scaffoldKey.currentContext!);
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
