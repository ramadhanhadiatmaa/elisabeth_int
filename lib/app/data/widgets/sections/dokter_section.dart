import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/doctor/controllers/doctor_controller.dart';
import '../../constants/color.dart';
import '../data/dokter_data.dart';
import '../tools/text_widget.dart';

class DokterSection extends StatelessWidget {
  const DokterSection({
    super.key,
    required this.doctorC,
  });

  final DoctorController doctorC;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                color: cRed,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    align: TextAlign.center,
                    title: "Nama Dokter",
                    color: cWhite,
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                color: cRed,
                width: 240,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    align: TextAlign.center,
                    title: "Spesialisasi",
                    color: cWhite,
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Container(
                color: cRed,
                width: 180,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextWidget(
                    align: TextAlign.center,
                    title: "Action",
                    color: cWhite,
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                itemCount: doctorC.dokterList.length,
                itemBuilder: (context, index) {
                  return DokterDataWidget(
                    doctorC: doctorC,
                    dokter: doctorC.dokterList[index].nama,
                    spesialis: doctorC.dokterList[index].spesialis,
                    kodeDokter: doctorC.dokterList[index].kodeDokter,
                  );
                })),
          ),
        ],
      ),
    );
  }
}
