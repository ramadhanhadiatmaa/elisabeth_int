import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../constants/color.dart';
import '../../constants/file_string.dart';
import '../tools/text_widget.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: cWhite,
            ),
            const Image(
              image: AssetImage(
                back,
              ),
              fit: BoxFit.cover,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const TextWidget(
                      title: "INFORMASI RUMAH SAKIT",
                      color: cWhite,
                      weight: FontWeight.w800,
                      size: 26,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: cRed,
                        ),
                        backgroundColor: cWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.pasien),
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "DAFTAR PASIEN",
                              color: cRed,
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: cRed,
                        ),
                        backgroundColor: cWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.poli),
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "JADWAL POLI",
                              color: cRed,
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: cRed,
                        ),
                        backgroundColor: cWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.doctor),
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "DAFTAR DOKTER",
                              color: cRed,
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: cRed,
                        ),
                        backgroundColor: cWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.bed),
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "KAMAR INAP",
                              color: cRed,
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () => Get.offAllNamed(Routes.home),
                      child: const SizedBox(
                        width: 240,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "KEMBALI",
                              color: cWhite,
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
