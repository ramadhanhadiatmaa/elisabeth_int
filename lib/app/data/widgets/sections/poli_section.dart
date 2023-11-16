import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/poli/controllers/poli_controller.dart';
import '../../constants/color.dart';
import '../data/poli_data.dart';

class PoliSection extends StatelessWidget {
  const PoliSection({
    super.key,
    required this.poliC,
  });

  final PoliController poliC;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Obx(() => ListView.builder(
              itemCount: poliC.poliList.length,
              itemBuilder: (context, index) {
                return PoliDataWidget(
                  poliC: poliC,
                  title: "Poli ${poliC.poliList[index].nama}",
                  dokter: poliC.poliList[index].dokter,
                  status: poliC.poliList[index].status,
                  color: (poliC.poliList[index].status == "Buka")
                      ? cRed
                      : cGrey.withOpacity(0.5),
                  kodePoli: poliC.poliList[index].kodePoli,
                );
              },
            )),
      ),
    );
  }
}
