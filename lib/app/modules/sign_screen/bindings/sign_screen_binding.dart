import 'package:get/get.dart';

import '../controllers/sign_screen_controller.dart';

class SignScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignScreenController>(
      () => SignScreenController(),
    );
  }
}
