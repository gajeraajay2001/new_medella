import 'package:get/get.dart';

import '../controllers/new_sign_up_2_controller.dart';

class NewSignUp2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewSignUp2Controller>(
      () => NewSignUp2Controller(),
    );
  }
}
