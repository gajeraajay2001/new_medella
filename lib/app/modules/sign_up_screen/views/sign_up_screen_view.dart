import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/utilities/text_field.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../../../utilities/utilities.dart';
import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetWidget<SignUpScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Space.height(80),
                      Container(
                          height: MySize.getHeight(209),
                          width: MySize.getWidth(172),
                          child: Image.asset("assets/images/medella_logo.png")),
                      Space.height(35),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Hello, Welcome to ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MySize.getHeight(24))),
                            TextSpan(
                                text: "medella",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: appTheme.primaryTheme,
                                    fontSize: MySize.getHeight(24))),
                          ],
                        ),
                      ),
                      Space.height(4),
                      Text(
                        "Sign up to continue",
                        style: TextStyle(
                            color: Color(0xff262626).withOpacity(0.5)),
                      ),
                      Space.height(24),
                      getTextField(
                          hintText: "Name",
                          prefixIcon: Container(
                              height: MySize.getHeight(24),
                              width: MySize.getWidth(24),
                              alignment: Alignment.center,
                              child:
                                  SvgPicture.asset(imagePath + "user_01.svg"))),
                      Space.height(10),
                      getTextField(
                          hintText: "Date of Birth",
                          prefixIcon: Container(
                              height: MySize.getHeight(24),
                              width: MySize.getWidth(24),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  imagePath + "calendar_icon.svg"))),
                      Space.height(10),
                      getTextField(
                          hintText: "Social Security",
                          prefixIcon: Container(
                              height: MySize.getHeight(24),
                              width: MySize.getWidth(24),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  imagePath + "shield_icon.svg"))),
                      Space.height(10),
                      getTextField(
                          hintText: "Upload id",
                          suffixIcon: Container(
                              height: MySize.getHeight(24),
                              width: MySize.getWidth(24),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  imagePath + "upload_icon.svg")),
                          prefixIcon: Container(
                              height: MySize.getHeight(24),
                              width: MySize.getWidth(24),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  imagePath + "id_card_icon.svg"))),
                      Space.height(25),
                    ],
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SIGN_UP_2_SCREEN);
                  },
                  child: getButton(title: "Next")),
              Space.height(37),
            ],
          ),
        ),
      ),
    );
  }
}
