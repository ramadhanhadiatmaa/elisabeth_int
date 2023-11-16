import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/doctor/controllers/doctor_controller.dart';
import '../../constants/color.dart';
import '../tools/button_widget.dart';
import '../tools/text_widget.dart';

class DokterDataWidget extends StatelessWidget {
  const DokterDataWidget({
    super.key,
    required this.doctorC,
    required this.dokter,
    required this.spesialis,
    required this.kodeDokter,
  });

  final DoctorController doctorC;
  final String dokter;
  final String spesialis;
  final String kodeDokter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                title: dokter,
                color: cBlack,
                weight: FontWeight.w400,
                size: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            width: 240,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                title: spesialis,
                color: cBlack,
                weight: FontWeight.w400,
                size: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            width: 180,
            child: ButtonWidget(
                title: "Delete",
                color: cBlue,
                press: () {
                  Get.defaultDialog(
                      contentPadding: const EdgeInsets.all(
                        20,
                      ),
                      title: "Menghapus Data Dokter",
                      middleText: "Apakah Kamu yakin ingin menghapus?",
                      actions: [
                        ButtonWidget(
                          title: "Batal",
                          color: cGrey,
                          press: () => Get.back(),
                        ),
                        ButtonWidget(
                          title: "HAPUS",
                          color: cRed,
                          press: () {
                            doctorC.deleteDataId(kodeDokter);
                          },
                        ),
                      ]);
                }),
          ),
        ],
      ),
    );
  }
}
