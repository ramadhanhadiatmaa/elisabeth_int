import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/widgets/sections/information_section.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  InformationView({Key? key}) : super(key: key);

  final infoC = Get.put(InformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: infoC.checkData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!
                  ? const InformationSection()
                  : const LoginValidation();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
