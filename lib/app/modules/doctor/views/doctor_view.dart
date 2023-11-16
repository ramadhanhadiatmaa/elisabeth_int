import '../../../data/constants/color.dart';
import '../../../data/widgets/sections/dokter_section.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';

class DoctorView extends GetView<DoctorController> {
  DoctorView({Key? key}) : super(key: key);

  final doctorC = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Dokter'),
        backgroundColor: cRed,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAndToNamed(Routes.information),
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: FutureBuilder(
          future: doctorC.checkData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!
                  ? DokterSection(doctorC: doctorC)
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
