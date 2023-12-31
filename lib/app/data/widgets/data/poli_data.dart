import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../modules/poli/controllers/poli_controller.dart';
import '../../constants/color.dart';
import '../tools/button_widget.dart';
import '../tools/text_widget.dart';

class PoliDataWidget extends StatelessWidget {
  const PoliDataWidget({
    super.key,
    required this.poliC,
    required this.title,
    required this.dokter,
    required this.status,
    required this.color,
    required this.kodePoli,
  });

  final PoliController poliC;

  final String title;
  final String dokter;
  final String status;
  final String kodePoli;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: cWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextWidget(
                  title: title,
                  color: cBlack,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 300,
                child: TextWidget(
                  title: dokter,
                  color: cBlack,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 50,
                child: TextWidget(
                  title: status,
                  color: color,
                  weight: FontWeight.w400,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ButtonWidget(
                  title: "UPDATE",
                  color: cBlue,
                  press: () {
                    poliC.getDataId(kodePoli);

                    Get.bottomSheet(
                      Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          color: cWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              60,
                            ),
                            topRight: Radius.circular(
                              60,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Obx(
                            () => Column(
                              children: [
                                TextWidget(
                                  title: "Update Poli ${poliC.poli.value}",
                                  color: cBlack,
                                  weight: FontWeight.w800,
                                  size: 16,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 400,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        title: "Nama Dokter : ",
                                        color: cBlack,
                                        weight: FontWeight.w500,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      SizedBox(
                                        child: Obx(() {
                                          if (poliC.isLoading.value) {
                                            return const CircularProgressIndicator();
                                          }
                                          return DropdownButton(
                                            value: poliC.namaC.value,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            style: GoogleFonts.montserrat(
                                              color: cBlack,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            underline: Container(
                                              color: Colors.transparent,
                                            ),
                                            items: poliC.doctors
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              poliC.namaC.value = newValue!;
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 400,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                        title: "Status Poli      : ",
                                        color: cBlack,
                                        weight: FontWeight.w500,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      SizedBox(
                                        child: Obx(() {
                                          if (poliC.isLoading.value) {
                                            return const CircularProgressIndicator();
                                          }
                                          return DropdownButton(
                                            value: poliC.statC.value,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            style: GoogleFonts.montserrat(
                                              color: cBlack,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            underline: Container(
                                              color: Colors.transparent,
                                            ),
                                            items:
                                                poliC.items.map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              poliC.statC.value = newValue!;
                                            },
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                    title: "UPDATE",
                                    color: cBlue,
                                    press: () {
                                      poliC.updateDataId(kodePoli);
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
