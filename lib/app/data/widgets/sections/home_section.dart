import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../constants/color.dart';
import '../../constants/file_string.dart';
import '../tools/text_widget.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
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
                      title: "Hallo, Selamat Datang!",
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
                      onPressed: () => Get.toNamed(Routes.information),
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "INFORMASI RUMAH SAKIT",
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
                      onPressed: () {},
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "DATA KEPEGAWAIAN",
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
                      onPressed: () {},
                      child: const SizedBox(
                        width: 300,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextWidget(
                              title: "PENGADUAN FASILITAS",
                              color: cRed,
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
