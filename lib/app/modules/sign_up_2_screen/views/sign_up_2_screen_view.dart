import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/utilities/text_field.dart';
import 'package:medella_new/app/utilities/utilities.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/constants.dart';
import '../controllers/sign_up_2_screen_controller.dart';

class SignUp2ScreenView extends GetWidget<SignUp2ScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Space.height(15),
                        Padding(
                          padding: EdgeInsets.only(left: MySize.getWidth(20)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: MySize.getHeight(35),
                              ),
                            ),
                          ),
                        ),
                        Space.height(30),
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
                          "Hospital information",
                          style: TextStyle(
                              color: Color(0xff262626).withOpacity(0.5)),
                        ),
                        Space.height(24),
                        getTextField(
                          hintText: "Hospital Network",
                          prefixIcon: Container(
                            height: MySize.getHeight(24),
                            width: MySize.getWidth(24),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              imagePath + "hospital_icon.svg",
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: appTheme.redColor,
                          ),
                        ),
                        Spacing.height(38),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.getWidth(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              Spacing.width(6),
                              Expanded(
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla",
                                  style:
                                      TextStyle(fontSize: MySize.getHeight(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacing.height(12),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySize.getWidth(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                    value: controller.checkBox2.value,
                                    onChanged: (val) {
                                      controller.checkBox2.value = val!;
                                    }),
                              ),
                              Spacing.width(6),
                              Expanded(
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla",
                                  style:
                                      TextStyle(fontSize: MySize.getHeight(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                getButton(title: "Submit"),
                Spacing.height(33),
              ],
            ),
          ),
        );
      }),
    );
  }
}
