import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../data/NetworkClient.dart';
import '../../../models/hospital_list_model.dart';
import '../../../models/user_profile_model.dart';
import '../../../utilities/progress_dialog_utils.dart';

class ProfileScreenController extends GetxController {
  RxBool hasData = false.obs;
  RxBool isOpen = false.obs;
  UserProfileData? profileData;
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
              profileData = res.data!.data!;
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
