import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/sections/home_section.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: homeC.checkData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data! ? HomeSection() : const LoginValidation();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
