import 'package:get/get.dart';

import '../modules/bed/bindings/bed_binding.dart';
import '../modules/bed/views/bed_view.dart';
import '../modules/doctor/bindings/doctor_binding.dart';
import '../modules/doctor/views/doctor_view.dart';
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
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.information,
      page: () => InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.bed,
      page: () => BedView(),
      binding: BedBinding(),
    ),
    GetPage(
      name: _Paths.poli,
      page: () => PoliView(),
      binding: PoliBinding(),
    ),
    GetPage(
      name: _Paths.doctor,
      page: () => DoctorView(),
      binding: DoctorBinding(),
    ),
  ];
}
