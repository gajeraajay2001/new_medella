import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewSignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController securityNumberController = TextEditingController();
  TextEditingController uploadIdController = TextEditingController();

  RxString gender = "Male".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
