import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/color.dart';
import '../../../data/widgets/sections/bed_section.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bed_controller.dart';

class BedView extends GetView<BedController> {
  BedView({Key? key}) : super(key: key);

  final bedC = Get.put(BedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamar Inap'),
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
          future: bedC.checkData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!
                  ? BedSection(bedC: bedC)
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
