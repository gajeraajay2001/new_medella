import 'package:get/get.dart';

import '../controllers/new_sign_up_controller.dart';

class NewSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewSignUpController>(
      () => NewSignUpController(),
    );
  }
}
