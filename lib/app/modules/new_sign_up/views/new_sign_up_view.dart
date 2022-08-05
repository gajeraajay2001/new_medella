import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';
import 'package:medella_new/main.dart';
import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/constants.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/text_field.dart';
import '../../../utilities/utilities.dart';
import '../controllers/new_sign_up_controller.dart';

class NewSignUpView extends GetWidget<NewSignUpController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MySize.getWidth(17)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Space.height(45),
                            Center(
                              child: Container(
                                  height: MySize.getHeight(209),
                                  width: MySize.getWidth(172),
                                  child: Image.asset(
                                      "assets/images/medella_logo.png")),
                            ),
                            Space.height(54),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: MySize.getHeight(24),
                                  fontWeight: FontWeight.w600),
                            ),
                            Space.height(7),
                            Text(
                              "Please fill up all details",
                              style: TextStyle(
                                  fontSize: MySize.getHeight(16),
                                  color: Color(0xff262626).withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            ),
                            Space.height(30),
                            getUnderLineTextBox(
                              textController: controller.nameController,
                              hintText: "Name",
                              prefix: Container(
                                height: MySize.getHeight(23),
                                width: MySize.getWidth(23),
                                padding: EdgeInsets.only(
                                    right: MySize.getWidth(0),
                                    bottom: MySize.getHeight(10)),
                                alignment: Alignment.center,
                                child:
                                    SvgPicture.asset(imagePath + "user_01.svg"),
                              ),
                              validation: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter First Name";
                                }
                                return null;
                              },
                            ),
                            Space.height(30),
                            getUnderLineTextBox(
                              textController: controller.dateController,
                              hintText: "Date of Birth",
                              readOnly: true,
                              onTap: () async {
                                pickDate(context: context).then((value) {
                                  controller.dateController.text =
                                      DateFormat("yyyy-MM-dd").format(value);
                                });
                              },
                              prefix: Container(
                                height: MySize.getHeight(23),
                                width: MySize.getWidth(23),
                                padding: EdgeInsets.only(
                                    right: MySize.getWidth(0),
                                    bottom: MySize.getHeight(10)),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    imagePath + "calendar_icon.svg"),
                              ),
                              validation: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Date Of Birth";
                                }
                                return null;
                              },
                            ),
                            Space.height(30),
                            getUnderLineTextBox(
                              textController:
                                  controller.securityNumberController,
                              hintText: "Social Security number",
                              prefix: Container(
                                height: MySize.getHeight(23),
                                width: MySize.getWidth(23),
                                padding: EdgeInsets.only(
                                    right: MySize.getWidth(0),
                                    bottom: MySize.getHeight(10)),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    imagePath + "shield_icon.svg"),
                              ),
                              validation: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Social Number";
                                }
                                return null;
                              },
                            ),
                            Space.height(30),
                            getUnderLineTextBox(
                              textController: controller.uploadIdController,
                              hintText: "Upload id",
                              readOnly: true,
                              prefix: Container(
                                height: MySize.getHeight(23),
                                width: MySize.getWidth(23),
                                padding: EdgeInsets.only(
                                    right: MySize.getWidth(0),
                                    bottom: MySize.getHeight(10)),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    imagePath + "id_card_icon.svg"),
                              ),
                              validation: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Upload Id";
                                }
                                return null;
                              },
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                      "png",
                                      "jpeg",
                                      "jpg",
                                      "DOC",
                                      "DOCX",
                                      "PDF",
                                      "XLS",
                                      "TXT",
                                      "ODT",
                                    ]);
                                if (!isNullEmptyOrFalse(result)) {
                                  if (isNullEmptyOrFalse(
                                      controller.pickedFile)) {
                                    controller.pickedFile =
                                        File(result!.files[0].path!).obs;
                                  } else {
                                    controller.pickedFile!.value =
                                        File(result!.files[0].path!);
                                  }
                                  controller.pickedPath.value =
                                      p.basenameWithoutExtension(
                                          controller.pickedFile!.value.path);
                                  controller.uploadIdController.text =
                                      controller.pickedPath.value;
                                }
                              },
                            ),
                            Space.height(20),
                            Row(
                              children: [
                                Radio(
                                    value: "Male",
                                    groupValue: controller.gender.value,
                                    onChanged: (String? value) {
                                      controller.gender.value = value!;
                                    }),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      color: (controller.gender.value == "Male")
                                          ? appTheme.primaryTheme
                                          : Color(0xff262626).withOpacity(0.5),
                                      fontSize: MySize.getHeight(16)),
                                ),
                                Radio(
                                    value: "Female",
                                    groupValue: controller.gender.value,
                                    onChanged: (String? value) {
                                      controller.gender.value = value!;
                                    }),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      color: (controller.gender.value ==
                                              "Female")
                                          ? appTheme.primaryTheme
                                          : Color(0xff262626).withOpacity(0.5),
                                      fontSize: MySize.getHeight(16)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (isNullEmptyOrFalse(controller.pickedFile) ||
                                  isNullEmptyOrFalse(controller.pickedPath)) {
                                getIt<CustomDialogs>().getDialog(
                                    title: "Invalid Data",
                                    desc: "Please select ");
                              } else {
                                Get.toNamed(Routes.NEW_SIGN_UP_2, arguments: {
                                  ArgumentConstant.firstName:
                                      controller.nameController.text,
                                  ArgumentConstant.dob: "2000-05-29",
                                  ArgumentConstant.ssn:
                                      controller.securityNumberController.text,
                                  ArgumentConstant.gender:
                                      controller.gender.value,
                                  ArgumentConstant.pickedIdFile:
                                      controller.pickedFile!.value,
                                  ArgumentConstant.pickedIdFilePath:
                                      controller.pickedPath.value,
                                });
                              }
                            }
                          },
                          child: getButton(
                              height: 46, width: 335, title: "Next"))),
                  Spacing.height(33),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getUnderLineTextBox({
    required TextEditingController textController,
    FormFieldValidator<String>? validation,
    required String hintText,
    Widget? prefix,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return getTextField(
      inlineBorder: true,
      textEditingController: textController,
      fillColor: Colors.transparent,
      size: 40,
      height: 45,
      hintText: hintText,
      hintSize: 18,
      prefixIcon: (isNullEmptyOrFalse(prefix)) ? SizedBox() : prefix,
      validation: validation,
      onTap: onTap,
      readOnly: readOnly,
    );
  }

  Future<DateTime> pickDate({required BuildContext context}) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1, 1),
      lastDate: DateTime.now(),
    );
    return date!;
  }
}
