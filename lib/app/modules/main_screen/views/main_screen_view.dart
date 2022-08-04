import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/modules/home/views/home_view.dart';
import 'package:medella_new/app/modules/profile_screen/views/profile_screen_view.dart';
import '../../../constants/constants.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetWidget<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          backgroundColor: (controller.currentIndex.value == 1)
              ? appTheme.lightBlueColor
              : Colors.white,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    child: PageView(
                  controller: controller.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (int index) {
                    controller.currentIndex.value = index;
                  },
                  children: [
                    HomeView(),
                    ProfileScreenView(),
                  ],
                )),
                Container(
                  height: MySize.getHeight(62),
                  width: MySize.getWidth(375),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MySize.getHeight(20)),
                        topLeft: Radius.circular(MySize.getHeight(20))),
                    border: Border.fromBorderSide(BorderSide(
                        color: appTheme.textGrayTheme.withOpacity(0.5))),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.currentIndex.value = 0;
                            controller.pageController.jumpToPage(0);
                          },
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(imagePath + "home_icon.svg",
                                      height: MySize.getHeight(20),
                                      width: MySize.getWidth(20),
                                      color:
                                          (controller.currentIndex.value == 0)
                                              ? appTheme.primaryTheme
                                              : appTheme.textGrayTheme),
                                  SizedBox(width: MySize.getWidth(15)),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                        fontSize: MySize.getHeight(16),
                                        color:
                                            (controller.currentIndex.value == 0)
                                                ? appTheme.primaryTheme
                                                : appTheme.textGrayTheme,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.currentIndex.value = 1;
                            controller.pageController.jumpToPage(1);
                          },
                          child: Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      imagePath + "user_Profile_icon.svg",
                                      color:
                                          (controller.currentIndex.value == 1)
                                              ? appTheme.primaryTheme
                                              : appTheme.textGrayTheme,
                                      height: MySize.getHeight(20),
                                      width: MySize.getWidth(20)),
                                  SizedBox(width: MySize.getWidth(15)),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      fontSize: MySize.getHeight(16),
                                      color:
                                          (controller.currentIndex.value == 1)
                                              ? appTheme.primaryTheme
                                              : appTheme.textGrayTheme,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
