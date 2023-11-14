import 'package:get/get.dart';

import '../controllers/bed_controller.dart';

class BedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BedController>(
      () => BedController(),
    );
  }
}
