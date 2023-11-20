import 'package:elisabeth_int/app/data/models/booking_model.dart';
import 'package:get/get.dart';

import '../../../data/services/api_service.dart';

class PasienController extends GetxController {
  RxBool isLoading = true.obs;

  var bookingList = <BookingModel>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);

      var data = await ApiService().fetchBookingData();

      bookingList.addAll(data);
    } catch (e) {
      Get.snackbar("Network Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}
