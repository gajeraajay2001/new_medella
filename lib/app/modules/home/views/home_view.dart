import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medella_new/app/constants/color_constant.dart';
import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: SizedBox(
            height: MySize.getHeight(35),
            width: MySize.getWidth(37),
            child: Image.asset(imagePath + "medella_icon.png"),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Medella",
            style: TextStyle(
                color: appTheme.primaryTheme,
                fontWeight: FontWeight.bold,
                fontSize: MySize.getHeight(24)),
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: MySize.getHeight(20)),
                Image.asset(imagePath + "home_icon_01.png"),
                SizedBox(height: MySize.getHeight(35)),
              ],
            )),
      ),
    );
  }
}
