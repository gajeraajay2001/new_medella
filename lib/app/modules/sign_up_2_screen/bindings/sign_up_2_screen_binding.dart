import 'package:get/get.dart';

import '../controllers/sign_up_2_screen_controller.dart';

class SignUp2ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUp2ScreenController>(
      () => SignUp2ScreenController(),
    );
  }
}
