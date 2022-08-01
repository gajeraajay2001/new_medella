import 'package:get/get.dart';

import 'package:medella_new/app/constants/constants.dart';
import 'package:medella_new/app/constants/sizeConstant.dart';
import 'package:medella_new/app/modules/home/bindings/home_binding.dart';
import 'package:medella_new/app/modules/home/views/home_view.dart';
import 'package:medella_new/app/modules/new_sign_up/bindings/new_sign_up_binding.dart';
import 'package:medella_new/app/modules/new_sign_up/views/new_sign_up_view.dart';
import 'package:medella_new/app/modules/new_sign_up_2/bindings/new_sign_up_2_binding.dart';
import 'package:medella_new/app/modules/new_sign_up_2/views/new_sign_up_2_view.dart';
import 'package:medella_new/app/modules/new_sign_up_3/bindings/new_sign_up_3_binding.dart';
import 'package:medella_new/app/modules/new_sign_up_3/views/new_sign_up_3_view.dart';
import 'package:medella_new/app/modules/otp_screen/bindings/otp_screen_binding.dart';
import 'package:medella_new/app/modules/otp_screen/views/otp_screen_view.dart';
import 'package:medella_new/app/modules/sign_screen/bindings/sign_screen_binding.dart';
import 'package:medella_new/app/modules/sign_screen/views/sign_screen_view.dart';
import 'package:medella_new/app/modules/sign_up_2_screen/bindings/sign_up_2_screen_binding.dart';
import 'package:medella_new/app/modules/sign_up_2_screen/views/sign_up_2_screen_view.dart';
import 'package:medella_new/app/modules/sign_up_screen/bindings/sign_up_screen_binding.dart';
import 'package:medella_new/app/modules/sign_up_screen/views/sign_up_screen_view.dart';
import 'package:medella_new/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:medella_new/app/modules/splash_screen/views/splash_screen_view.dart';

import '../../main.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_SCREEN,
      page: () => SignScreenView(),
      binding: SignScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_2_SCREEN,
      page: () => SignUp2ScreenView(),
      binding: SignUp2ScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () => OtpScreenView(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEW_SIGN_UP,
      page: () => NewSignUpView(),
      binding: NewSignUpBinding(),
    ),
    GetPage(
      name: _Paths.NEW_SIGN_UP_2,
      page: () => NewSignUp2View(),
      binding: NewSignUp2Binding(),
    ),
    GetPage(
      name: _Paths.NEW_SIGN_UP_3,
      page: () => NewSignUp3View(),
      binding: NewSignUp3Binding(),
    ),
  ];
}
