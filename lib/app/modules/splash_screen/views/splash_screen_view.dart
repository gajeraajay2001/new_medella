import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/sizeConstant.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetWidget<SplashScreenController>{
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(child: Image.asset("assets/images/medella_logo.png")),
      ),
    );
  }
}
