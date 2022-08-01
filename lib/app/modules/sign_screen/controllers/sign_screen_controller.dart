import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';

class SignScreenController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();
  Rx<Country>? selectedCountry;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    initCountry(context: Get.context!);
    super.onInit();
  }

  void initCountry({required BuildContext context}) async {
    hasData.value = false;
    final country = await getDefaultCountry(context);
    if (!isNullEmptyOrFalse(country)) {
      selectedCountry = country.obs;
      hasData.value = true;
      print("Data : = ${selectedCountry!.value.name}");
    }
  }

  void showCountryPicker({required BuildContext context}) async {
    final country = await showCountryPickerSheet(context);
    if (country != null) {
      selectedCountry!.value = country;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
