import 'package:get/get.dart';

import '../controllers/select_hospital_screen_controller.dart';

class SelectHospitalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectHospitalScreenController>(
      () => SelectHospitalScreenController(),
    );
  }
}
