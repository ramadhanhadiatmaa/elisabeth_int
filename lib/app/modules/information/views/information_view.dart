import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/widgets/sections/information_section.dart';
import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InformationSection());
  }
}
