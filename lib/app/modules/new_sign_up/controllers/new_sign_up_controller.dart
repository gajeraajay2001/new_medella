import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewSignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController securityNumberController = TextEditingController();
  TextEditingController uploadIdController = TextEditingController();
  Rx<File>? pickedFile;
  RxString pickedPath = "".obs;
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
