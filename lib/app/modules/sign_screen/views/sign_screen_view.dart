import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/routes/app_pages.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';
import 'package:medella_new/app/utilities/utilities.dart';
import 'package:medella_new/main.dart';
import '../../../constants/constants.dart';
import '../controllers/sign_screen_controller.dart';

class SignScreenView extends GetView<SignScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: (controller.hasData.isFalse)
                ? Center(
                    child:
                        CircularProgressIndicator(color: appTheme.primaryTheme),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Space.height(80),
                        Container(
                            height: MySize.getHeight(209),
                            width: MySize.getWidth(172),
                            child:
                                Image.asset("assets/images/medella_logo.png")),
                        Space.height(35),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Welcome to ",
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
                        Space.height(2),
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                              color: Color(0xff262626).withOpacity(0.5)),
                        ),
                        Space.height(24),
                        Container(
                          height: MySize.getHeight(60),
                          width: MySize.getWidth(335),
                          decoration: BoxDecoration(
                            color: appTheme.grayTheme,
                            borderRadius:
                                BorderRadius.circular(MySize.getHeight(15)),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.showCountryPicker(
                                      context: context);
                                },
                                child: Container(
                                  height: MySize.getHeight(43),
                                  width: MySize.getWidth(99),
                                  margin: EdgeInsets.only(
                                      left: MySize.getWidth(7),
                                      top: MySize.getHeight(9),
                                      bottom: MySize.getHeight(8)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        MySize.getHeight(15)),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: MySize.getWidth(10)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: MySize.getHeight(29),
                                        width: MySize.getWidth(29),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(controller
                                                  .selectedCountry!.value.flag),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Space.width(7),
                                      Text(
                                          "${controller.selectedCountry!.value.countryCode}"),
                                      Icon(Icons.expand_more,
                                          size: MySize.getHeight(20)),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.mobileNumber,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number",
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: MySize.getWidth(25))),
                                  style:
                                      TextStyle(fontSize: MySize.getHeight(16)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Space.height(37),
                        InkWell(
                            onTap: () {
                              box.write(ArgumentConstant.mobileNumber,
                                  controller.mobileNumber.text);
                              verifyMobileNumber(
                                  context: context,
                                  mobileNumber: controller.mobileNumber.text,
                                  route: Routes.OTP_SCREEN);
                            },
                            child: getButton(title: "Get Otp")),
                        Space.height(37),
                        Row(
                          children: [
                            SizedBox(width: MySize.getWidth(20)),
                            SizedBox(
                                width: MySize.getWidth(151), child: Divider()),
                            SizedBox(width: MySize.getWidth(10)),
                            Text(
                              "Or",
                              style: TextStyle(
                                  color: Color(0xff262626).withOpacity(0.2)),
                            ),
                            SizedBox(width: MySize.getWidth(10)),
                            SizedBox(
                                width: MySize.getWidth(151), child: Divider()),
                          ],
                        ),
                        Space.height(37),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SIGN_UP_SCREEN);
                              },
                              child: getContainer(
                                  height: 42,
                                  width: 108,
                                  image: "assets/images/google_icon.svg",
                                  text: "Google"),
                            ),
                            Space.width(6),
                            InkWell(
                              onTap: () async {},
                              child: getContainer(
                                  height: 42,
                                  width: 108,
                                  image: "assets/images/facebook_icon.svg",
                                  text: "Facebook"),
                            ),
                            Space.width(6),
                            getContainer(
                                height: 42,
                                width: 108,
                                image: "assets/images/apple_icon.svg",
                                text: "Apple"),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Widget getContainer({
    required double height,
    required double width,
    String text = "",
    required String image,
  }) {
    return Container(
      height: MySize.getHeight(height),
      width: MySize.getWidth(width),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: appTheme.borderGrayTheme,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: MySize.getHeight(20),
            width: MySize.getWidth(20),
          ),
          Space.width(6),
          Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: MySize.getHeight(14)),
          ),
        ],
      ),
    );
  }
}
