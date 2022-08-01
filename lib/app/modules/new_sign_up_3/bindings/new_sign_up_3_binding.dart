import 'package:get/get.dart';

import '../controllers/new_sign_up_3_controller.dart';

class NewSignUp3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewSignUp3Controller>(
      () => NewSignUp3Controller(),
    );
  }
}
