import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/routes/app_pages.dart';
import 'package:medella_new/app/utilities/progress_dialog_utils.dart';
import '../../../../main.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/utilities.dart';
import '../controllers/new_sign_up_2_controller.dart';
import 'package:image_picker/image_picker.dart';

class NewSignUp2View extends GetWidget<NewSignUp2Controller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
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
                            child: InkWell(
                              onTap: () {
                                pickImage(
                                    context: context, controller: controller);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    MySize.getHeight(500)),
                                child: Container(
                                  height: MySize.getHeight(130),
                                  width: MySize.getWidth(130),
                                  // padding: EdgeInsets.all(MySize.getHeight(20)),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(
                                    //     MySize.getHeight(502)),
                                    border: Border.all(color: Colors.black),
                                    image: (!controller.isFilePicked.value)
                                        ? null
                                        : DecorationImage(
                                            image: FileImage(
                                                controller.pickedFile!.value),
                                            fit: BoxFit.cover),
                                  ),
                                  child: (controller.isFilePicked.value)
                                      ? null
                                      : Icon(Icons.file_upload,
                                          size: MySize.getHeight(50)),
                                ),
                              ),
                            ),
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
                          CSCPicker(
                            layout: Layout.vertical,
                            countryDropdownLabel: controller.countryValue.value,
                            stateDropdownLabel: controller.stateValue.value,
                            cityDropdownLabel: controller.cityValue.value,
                            showStates: (controller.countryValue.value ==
                                    "Select Country")
                                ? false
                                : true,
                            showCities:
                                (controller.stateValue.value == "Select State")
                                    ? false
                                    : true,
                            disabledDropdownDecoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color(0xff262626).withOpacity(0.2))),
                            ),
                            dropdownDecoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color(0xff262626).withOpacity(0.2))),
                            ),
                            currentCountry: controller.countryValue.value,
                            onCountryChanged: (value) {
                              controller.countryValue.value = value;

                              controller.stateValue.value = "Select State";
                              controller.cityValue.value = "Select City";
                            },
                            onStateChanged: (value) {
                              controller.stateValue.value =
                                  value ?? "Select State";
                              controller.cityValue.value = "Select City";
                            },
                            onCityChanged: (value) {
                              controller.cityValue.value =
                                  value ?? "Select City";
                            },
                          ),
                          // SelectState(
                          //   onCountryChanged: (value) {
                          //     if (isNullEmptyOrFalse(controller.countryValue)) {
                          //       controller.countryValue = value.obs;
                          //     } else {
                          //       controller.countryValue!.value = value;
                          //     }
                          //   },
                          //   onStateChanged: (value) {
                          //     if (isNullEmptyOrFalse(controller.stateValue)) {
                          //       controller.stateValue = value.obs;
                          //     } else {
                          //       controller.stateValue!.value = value;
                          //     }
                          //   },
                          //   onCityChanged: (value) {
                          //     if (isNullEmptyOrFalse(controller.cityValue)) {
                          //       controller.cityValue = value.obs;
                          //     } else {
                          //       controller.cityValue!.value = value;
                          //     }
                          //   },
                          // ),
                          Space.height(20),
                          Row(
                            children: [
                              SizedBox(
                                height: MySize.getHeight(18),
                                width: MySize.getWidth(18),
                                child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(5)),
                                    ),
                                    side: BorderSide(
                                        width: MySize.getHeight(1),
                                        color: appTheme.primaryTheme),
                                    value: controller.checkBox1.value,
                                    onChanged: (val) {
                                      controller.checkBox1.value = val!;
                                    }),
                              ),
                              Space.width(10),
                              Text(
                                "I agree to the Medella Terms and Conditions",
                                style:
                                    TextStyle(fontSize: MySize.getHeight(14)),
                              ),
                            ],
                          ),
                          Space.height(50),
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    if (controller.countryValue.value ==
                                            "Select Country" ||
                                        controller.stateValue.value ==
                                            "Select State" ||
                                        controller.cityValue.value ==
                                            "Select City") {
                                      getIt<CustomDialogs>().getDialog(
                                          title: "Invalid Data",
                                          desc:
                                              "Please enter valid Country, State and City.");
                                    } else if (isNullEmptyOrFalse(
                                        controller.pickedFile)) {
                                      getIt<CustomDialogs>().getDialog(
                                          title: "Invalid Data",
                                          desc: "Please Upload profile.");
                                    } else if (controller.checkBox1.isFalse) {
                                      getIt<CustomDialogs>().getDialog(
                                          title: "Terms And Condition",
                                          desc:
                                              "Please accept Terms And Condition.");
                                    } else {
                                      controller.signUpUserApi(
                                          context: context);
                                    }
                                  },
                                  child: getButton(
                                      title: "Submit",
                                      height: 46,
                                      width: 335))),
                          Spacing.height(33),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      })),
    );
  }

  pickImage(
      {required BuildContext context,
      required NewSignUp2Controller controller}) {
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
                              if (controller.isFilePicked.value) {
                                controller.pickedFile!.value = file;
                              } else {
                                controller.pickedFile = file.obs;
                              }
                              controller.isFilePicked.value = true;

                              controller.pickedFile!.refresh();
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
                              if (controller.isFilePicked.value) {
                                controller.pickedFile!.value = file;
                              } else {
                                controller.pickedFile = file.obs;
                              }
                              controller.isFilePicked.value = true;

                              controller.pickedFile!.refresh();
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
