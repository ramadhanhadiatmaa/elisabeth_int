import 'package:elisabeth_int/app/data/constants/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bed_controller.dart';

class BedView extends GetView<BedController> {
  const BedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamar Inap'),
        backgroundColor: cRed,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'BedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
