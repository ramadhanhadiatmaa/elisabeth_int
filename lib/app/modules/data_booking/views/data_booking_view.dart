import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_booking_controller.dart';

class DataBookingView extends GetView<DataBookingController> {
  const DataBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DataBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
