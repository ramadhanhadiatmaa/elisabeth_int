import 'package:get/get.dart';

import '../controllers/data_booking_controller.dart';

class DataBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataBookingController>(
      () => DataBookingController(),
    );
  }
}
