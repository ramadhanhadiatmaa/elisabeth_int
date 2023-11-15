import 'package:get/get.dart';

import '../modules/bed/bindings/bed_binding.dart';
import '../modules/bed/views/bed_view.dart';
import '../modules/data_booking/bindings/data_booking_binding.dart';
import '../modules/data_booking/views/data_booking_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/poli/bindings/poli_binding.dart';
import '../modules/poli/views/poli_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.dataBooking,
      page: () => const DataBookingView(),
      binding: DataBookingBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.information,
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.bed,
      page: () => const BedView(),
      binding: BedBinding(),
    ),
    GetPage(
      name: _Paths.poli,
      page: () => PoliView(),
      binding: PoliBinding(),
    ),
  ];
}
