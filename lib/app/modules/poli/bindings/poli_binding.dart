import 'package:get/get.dart';

import '../controllers/poli_controller.dart';

class PoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliController>(
      () => PoliController(),
    );
  }
}
