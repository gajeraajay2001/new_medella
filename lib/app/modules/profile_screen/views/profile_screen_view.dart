import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/utilities/utilities.dart';
import '../../../../main.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetWidget<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (controller) {
          return SafeArea(
            child: Obx(() {
              return Scaffold(
                key: controller.scaffoldKey,
                backgroundColor: appTheme.lightBlueColor,
                body: (controller.hasData.isFalse)
                    ? Center(
                        child: CircularProgressIndicator(
                            color: appTheme.primaryTheme))
                    : (isNullEmptyOrFalse(controller.profileData))
                        ? Center(
                            child: Text("Something went wrong....."),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: MySize.getWidth(10)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: MySize.getHeight(20)),
                                  getTopWidget(),
                                  SizedBox(height: MySize.getHeight(17)),
                                  InkWell(
                                    onTap: () {
                                      pickImage(
                                          context: context,
                                          controller: controller);
                                    },
                                    child: Stack(
                                      children: [
                                        ClipOval(
                                          //borderRadius: BorderRadius.circular(999999),
                                          child: Container(
                                            height: MySize.getHeight(100),
                                            width: MySize.getWidth(100),
                                            color: Colors.white,
                                            child: (isNullEmptyOrFalse(
                                                    controller.profileData!
                                                        .value.userImage))
                                                ? SizedBox()
                                                : getImageByLink(
                                                    url: controller.profileData!
                                                        .value.userImage!,
                                                    boxFit: BoxFit.cover,
                                                    height:
                                                        MySize.getHeight(100),
                                                    width:
                                                        MySize.getWidth(100)),
                                          ),
                                        ),
                                        Positioned(
                                            right: 0,
                                            top: MySize.getHeight(3),
                                            child: SvgPicture.asset(
                                                imagePath + "edit_icon.svg")),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MySize.getHeight(10)),
                                  Center(
                                    child: MyText(
                                        context,
                                        controller.profileData!.value.userName
                                            .toString(),
                                        TextAlign.center,
                                        Colors.black,
                                        MySize.getHeight(20),
                                        FontWeight.w500),
                                  ),
                                  SizedBox(height: MySize.getHeight(20)),
                                  Container(
                                    width: double.infinity,
                                    height: MySize.getHeight(450),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(15)),
                                      color: Colors.white,
                                    ),
                                    padding:
                                        EdgeInsets.all(MySize.getHeight(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            getTextData(
                                                text1: "Name",
                                                isFirst: true,
                                                text2: controller
                                                    .profileData!.value.userName
                                                    .toString()),
                                            getTextData(
                                                text1: "Date of birth",
                                                text2: DateFormat(
                                                        "dd MMM, yyyy")
                                                    .format(
                                                        DateFormat("yyyy-mm-dd")
                                                            .parse(controller
                                                                .profileData!
                                                                .value
                                                                .dob
                                                                .toString()))),
                                          ],
                                        ),
                                        SizedBox(height: MySize.getHeight(30)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            getTextData(
                                                text1: "Social security number",
                                                isFirst: true,
                                                text2: controller.profileData!
                                                    .value.socialSecurity
                                                    .toString()),
                                            getTextData(
                                                text1: "Blood Type",
                                                text2: "A+"),
                                          ],
                                        ),
                                        SizedBox(height: MySize.getHeight(30)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            getTextData(
                                                text1: "Medicale condition",
                                                isFirst: true,
                                                text2: "Not listed"),
                                            getTextData(
                                                text1: "Mobile number",
                                                text2: controller
                                                    .profileData!.value.mobile
                                                    .toString()),
                                          ],
                                        ),
                                        SizedBox(height: MySize.getHeight(30)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            getTextData(
                                                text1: "Allergies & Reactions",
                                                isFirst: true,
                                                text2: "Not listed"),
                                            getTextData(
                                                text1: "Gender", text2: "Male"),
                                          ],
                                        ),
                                        SizedBox(height: MySize.getHeight(30)),
                                        getTextData(
                                            text1: "Medications",
                                            isFirst: true,
                                            text2: "Not listed"),
                                        SizedBox(height: MySize.getHeight(30)),
                                        Center(
                                            child: InkWell(
                                          onTap: () {
                                            box.write(
                                                ArgumentConstant.token, "l");
                                            Get.offAllNamed(Routes.SIGN_SCREEN);
                                          },
                                          child: getButton(
                                              title: "Log Out",
                                              backColor: Colors.transparent,
                                              color: appTheme.primaryTheme,
                                              borderColor:
                                                  appTheme.primaryTheme,
                                              height: MySize.getHeight(46),
                                              width: MySize.getWidth(122)),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
              );
            }),
          );
        });
  }

  Widget getTopWidget() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.chevron_left,
            //   size: MySize.getHeight(35),
            // ),
            // SizedBox(width: MySize.getWidth(44)),
            Container(
              height: MySize.getHeight(30),
              width: MySize.getWidth(164),
              alignment: Alignment.center,
              child: Text(
                "Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MySize.getHeight(20)),
              ),
            ),
          ],
        ));
  }

  Widget getTextData(
      {required String text1, required String text2, bool isFirst = false}) {
    return Column(
      crossAxisAlignment:
          (isFirst) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          text1,
          style: TextStyle(
              color: appTheme.textGrayTheme,
              fontWeight: FontWeight.w600,
              fontSize: MySize.getHeight(14)),
        ),
        SizedBox(height: MySize.getHeight(2)),
        Text(
          text2,
          style: TextStyle(
              color: appTheme.primaryTheme,
              fontWeight: FontWeight.w600,
              fontSize: MySize.getHeight(16)),
        ),
      ],
    );
  }

  pickImage(
      {required BuildContext context,
      required ProfileScreenController controller}) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).pop();
                            ImagePicker picker = ImagePicker();
                            XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (!isNullEmptyOrFalse(image)) {
                              File file = File(image!.path);
                              controller.updateProfile(
                                  context: context, pickedFile: file);
                            } else {
                              // User canceled the picker
                            }
                            // setState(() {});
                          },
                          child: Column(
                            children: [
                              Icon(Icons.collections,
                                  size: MySize.getHeight(50)),
                              Text(
                                "Gallery",
                                style:
                                    TextStyle(fontSize: MySize.getHeight(20)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: MySize.getHeight(100)),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).pop();
                            ImagePicker picker = ImagePicker();
                            XFile? image = await picker.pickImage(
                                source: ImageSource.camera);

                            if (!isNullEmptyOrFalse(image)) {
                              File file = File(image!.path);
                              controller.updateProfile(
                                  context: context, pickedFile: file);
                            } else {
                              // User canceled the picker
                            }
                            // setState(() {});
                          },
                          child: Column(
                            children: [
                              Icon(Icons.photo_camera,
                                  size: MySize.getHeight(50)),
                              Text(
                                "Camera",
                                style:
                                    TextStyle(fontSize: MySize.getHeight(20)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
