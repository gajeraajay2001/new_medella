import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: MySize.getWidth(17)),
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
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                  right: MySize.getWidth(10),
                                  bottom: MySize.getHeight(5)),
                              child:
                                  SvgPicture.asset(imagePath + "user_01.svg"),
                            ),
                          ),
                          Space.height(30),
                          getUnderLineTextBox(
                            textController: controller.dateController,
                            hintText: "Date of Birth",
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                  right: MySize.getWidth(10),
                                  bottom: MySize.getHeight(5)),
                              child: SvgPicture.asset(
                                  imagePath + "calendar_icon.svg"),
                            ),
                          ),
                          Space.height(30),
                          getUnderLineTextBox(
                            textController: controller.securityNumberController,
                            hintText: "Social Security number",
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                  right: MySize.getWidth(10),
                                  bottom: MySize.getHeight(5)),
                              child: SvgPicture.asset(
                                  imagePath + "shield_icon.svg"),
                            ),
                          ),
                          Space.height(30),
                          getUnderLineTextBox(
                            textController: controller.uploadIdController,
                            hintText: "Upload id",
                            prefix: Padding(
                              padding: EdgeInsets.only(
                                  right: MySize.getWidth(10),
                                  bottom: MySize.getHeight(5)),
                              child: SvgPicture.asset(
                                  imagePath + "id_card_icon.svg"),
                            ),
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
                                    color: (controller.gender.value == "Female")
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
                          Get.toNamed(Routes.NEW_SIGN_UP_2);
                        },
                        child:
                            getButton(height: 46, width: 335, title: "Next"))),
                Spacing.height(33),
              ],
            ),
          ),
        );
      }),
    );
  }

  getUnderLineTextBox({
    required TextEditingController textController,
    required String hintText,
    Widget? prefix,
  }) {
    return getTextField(
      inlineBorder: true,
      textEditingController: textController,
      fillColor: Colors.transparent,
      size: 30,
      height: 30,
      hintText: hintText,
      hintSize: 18,
      prefixIcon: (isNullEmptyOrFalse(prefix)) ? SizedBox() : prefix,
    );
  }
}
