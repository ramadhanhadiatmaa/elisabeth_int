import 'package:get/get.dart';

import '../modules/data_booking/bindings/data_booking_binding.dart';
import '../modules/data_booking/views/data_booking_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.dataBooking,
      page: () => const DataBookingView(),
      binding: DataBookingBinding(),
    ),
  ];
}
