import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/utilities/utilities.dart';

import '../../../constants/sizeConstant.dart';
import '../controllers/new_sign_up_3_controller.dart';

class NewSignUp3View extends GetView<NewSignUp3Controller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        Space.height(92),
                        Center(
                          child: Text(
                            "Your registration needs to be completed by a Hospital, Please select your nearest hospital.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: MySize.getHeight(14),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Space.height(79),
                        getButton(
                          backColor: Colors.white,
                          borderColor: appTheme.grayTheme,
                          color: appTheme.primaryTheme,
                          title: "Select hospital",
                        ),
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
  }
}
