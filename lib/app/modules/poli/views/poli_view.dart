import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/color.dart';
import '../../../data/widgets/sections/poli_section.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../../../routes/app_pages.dart';
import '../controllers/poli_controller.dart';

class PoliView extends GetView<PoliController> {
  PoliView({Key? key}) : super(key: key);

  final poliC = Get.put(PoliController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Poli'),
        centerTitle: true,
        backgroundColor: cRed,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.information),
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: FutureBuilder(
          future: poliC.checkData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!
                  ? PoliSection(poliC: poliC)
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
