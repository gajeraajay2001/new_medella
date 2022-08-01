import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/routes/app_pages.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/sizeConstant.dart';
import '../../../utilities/utilities.dart';
import '../controllers/new_sign_up_2_controller.dart';

class NewSignUp2View extends GetWidget<NewSignUp2Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SafeArea(
        child: Scaffold(
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
                            onCountryChanged: (value) {
                              controller.countryValue.value = value;
                            },
                            onStateChanged: (value) {
                              controller.stateValue.value =
                                  value ?? "Select State";
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
                                    Get.toNamed(Routes.NEW_SIGN_UP_3);
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
        ),
      );
    }));
  }
}
