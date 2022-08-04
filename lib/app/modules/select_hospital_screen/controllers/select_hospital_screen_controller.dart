import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/models/hospital_list_model.dart';
import 'package:medella_new/app/routes/app_pages.dart';
import '../../../../main.dart';
import '../../../constants/constants.dart';
import '../../../data/NetworkClient.dart';
import '../../../utilities/progress_dialog_utils.dart';

class SelectHospitalScreenController extends GetxController {
  RxBool hasData = false.obs;
  RxList<HospitalData> hospitals = RxList([]);
  @override
  void onInit() {
    getHospitalList(context: Get.context!);
    super.onInit();
  }

  getHospitalList({required BuildContext context}) async {
    hasData.value = false;
    Map<String, dynamic> dict = {};
    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.getHospitalList,
      MethodType.Get,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        hasData.value = true;
        if (response["status"] == 200) {
          HospitalListModel res = HospitalListModel.fromJson(response);
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.hospitalData)) {
              res.data!.hospitalData!.forEach((element) {
                hospitals.add(element);
              });
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

  addHospital({required BuildContext context, required int id}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["HospitalId"] = id;

    return NetworkClient.getInstance.callApi(
      context,
      baseUrl,
      ApiConstant.addHospital,
      MethodType.Post,
      header: NetworkClient.getInstance.getAuthHeaders(),
      params: dict,
      successCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);
        hasData.value = true;
        if (response["status"] == 200) {
          Get.offAllNamed(Routes.MAIN_SCREEN);
        } else {
          getIt<CustomDialogs>()
              .getDialog(title: "Failed", desc: response["message"]);
        }
      },
      failureCallback: (response, message) {
        getIt<CustomDialogs>().hideCircularDialog(context);
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
