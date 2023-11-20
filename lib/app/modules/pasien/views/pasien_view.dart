import 'package:elisabeth_int/app/data/constants/color.dart';
import 'package:elisabeth_int/app/data/widgets/tools/button_widget.dart';
import 'package:elisabeth_int/app/data/widgets/tools/text_widget.dart';
import 'package:elisabeth_int/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/pasien_controller.dart';

class PasienView extends GetView<PasienController> {
  PasienView({Key? key}) : super(key: key);

  final pasienC = Get.put(PasienController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pasien'),
        backgroundColor: cRed,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.information),
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            color: cWhite,
            child: SizedBox(
              width: 600,
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabWidget(
                          title: "QR Code",
                          size: 100,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "No RM",
                          size: 120,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Nama",
                          size: 240,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Jenis",
                          size: 80,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Bayar",
                          size: 80,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Poli",
                          size: 160,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Tanggal",
                          size: 80,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Status",
                          size: 80,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        TabWidget(
                          title: "Actions",
                          size: 80,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                            itemCount: pasienC.bookingList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Center(
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: QrImageView(
                                                data: pasienC
                                                    .bookingList[index].id,
                                                version: QrVersions.auto,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 120,
                                          child: Center(
                                            child: TextWidget(
                                              title: (pasienC.bookingList[index]
                                                          .rm ==
                                                      ""
                                                  ? "-"
                                                  : pasienC
                                                      .bookingList[index].rm),
                                              color: cBlack,
                                              weight: FontWeight.w500,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 240,
                                          child: TextWidget(
                                            title:
                                                pasienC.bookingList[index].nama,
                                            color: cBlack,
                                            weight: FontWeight.w500,
                                            size: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Center(
                                            child: TextWidget(
                                              title: (pasienC.bookingList[index]
                                                          .rm ==
                                                      "")
                                                  ? "Baru"
                                                  : "Lama",
                                              color: (pasienC.bookingList[index]
                                                          .rm ==
                                                      "")
                                                  ? cRed
                                                  : cBlack,
                                              weight: FontWeight.w500,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Center(
                                            child: TextWidget(
                                              title: pasienC
                                                  .bookingList[index].bayar,
                                              color: cBlack,
                                              weight: FontWeight.w500,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 160,
                                          child: TextWidget(
                                            title:
                                                pasienC.bookingList[index].poli,
                                            color: cBlack,
                                            weight: FontWeight.w500,
                                            size: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Center(
                                            child: TextWidget(
                                              title: pasienC
                                                  .bookingList[index].tanggal
                                                  .toString(),
                                              color: cBlack,
                                              weight: FontWeight.w500,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Center(
                                            child: TextWidget(
                                              title: pasienC
                                                  .bookingList[index].selesai,
                                              color: cBlack,
                                              weight: FontWeight.w500,
                                              size: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ButtonWidget(
                                              title: "det",
                                              color: cBlue,
                                              press: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.title,
    required this.size,
  });

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cRed,
      width: size,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(
            title: title,
            color: cWhite,
            weight: FontWeight.w500,
            size: 12,
          ),
        ),
      ),
    );
  }
}
