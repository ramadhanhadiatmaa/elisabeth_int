import 'package:elisabeth_int/app/data/constants/color.dart';
import 'package:elisabeth_int/app/data/widgets/tools/button_widget.dart';
import 'package:elisabeth_int/app/data/widgets/tools/text_widget.dart';
import 'package:elisabeth_int/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../data/widgets/data/pasien_data.dart';
import '../../../data/widgets/tools/login_validation.dart';
import '../../../data/widgets/tools/tab_widget.dart';
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
        body: FutureBuilder(
            future: pasienC.checkData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!
                    ? ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            color: cWhite,
                            child: SizedBox(
                              width: 600,
                              height: MediaQuery.sizeOf(context).height,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          title: "Bulan",
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
                                            itemCount:
                                                pasienC.bookingList.length,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                height: 50,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 100,
                                                          child: Center(
                                                            child: SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  QrImageView(
                                                                data: pasienC
                                                                    .bookingList[
                                                                        index]
                                                                    .id,
                                                                version:
                                                                    QrVersions
                                                                        .auto,
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
                                                              title: (pasienC
                                                                          .bookingList[
                                                                              index]
                                                                          .rm ==
                                                                      ""
                                                                  ? "-"
                                                                  : pasienC
                                                                      .bookingList[
                                                                          index]
                                                                      .rm),
                                                              color: cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                            title: pasienC
                                                                .bookingList[
                                                                    index]
                                                                .nama,
                                                            color: cBlack,
                                                            weight:
                                                                FontWeight.w500,
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
                                                              title: (pasienC
                                                                          .bookingList[
                                                                              index]
                                                                          .rm ==
                                                                      "")
                                                                  ? "Baru"
                                                                  : "Lama",
                                                              color: (pasienC
                                                                          .bookingList[
                                                                              index]
                                                                          .rm ==
                                                                      "")
                                                                  ? cRed
                                                                  : cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                                  .bookingList[
                                                                      index]
                                                                  .bayar,
                                                              color: cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                            title: pasienC
                                                                .bookingList[
                                                                    index]
                                                                .poli,
                                                            color: cBlack,
                                                            weight:
                                                                FontWeight.w500,
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
                                                                  .bookingList[
                                                                      index]
                                                                  .tanggal
                                                                  .toString(),
                                                              color: cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                                  .bookingList[
                                                                      index]
                                                                  .bulan
                                                                  .toString(),
                                                              color: cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                                  .bookingList[
                                                                      index]
                                                                  .selesai,
                                                              color: cBlack,
                                                              weight: FontWeight
                                                                  .w500,
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
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: ButtonWidget(
                                                              title: "detail",
                                                              color: cBlue,
                                                              press: () {
                                                                pasienC.getDataId(
                                                                    pasienC
                                                                        .bookingList[
                                                                            index]
                                                                        .id);

                                                                Get.bottomSheet(
                                                                  Container(
                                                                    height: 500,
                                                                    color:
                                                                        cWhite,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          20.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                600,
                                                                            child:
                                                                                Obx(
                                                                              () => Column(
                                                                                children: [
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Nama Pasien: ",
                                                                                    data: pasienC.namaC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Nama Pasien: ",
                                                                                    data: pasienC.poliC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "KTP: ",
                                                                                    data: pasienC.ktpC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Nomor Rekam Medis: ",
                                                                                    data: pasienC.rmC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Lama/Baru: ",
                                                                                    data: (pasienC.rmC.value == "") ? "Baru" : "Lama",
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Jenis Bayar: ",
                                                                                    data: pasienC.bayarC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Tanggal Daftar: ",
                                                                                    data: "${pasienC.tanggalC.value} ${pasienC.bulanC.value}",
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Tempat Lahir: ",
                                                                                    data: pasienC.tempatC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Tanggal Lahir: ",
                                                                                    data: pasienC.lahirC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Nomor Telepon: ",
                                                                                    data: pasienC.teleponC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Alamat: ",
                                                                                    data: pasienC.alamatC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Kelamin: ",
                                                                                    data: pasienC.kelaminC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Agama: ",
                                                                                    data: pasienC.agamaC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Ibu: ",
                                                                                    data: pasienC.ibuC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Keluarga: ",
                                                                                    data: pasienC.keluargaC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Suku: ",
                                                                                    data: pasienC.sukuC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Pekerjaan: ",
                                                                                    data: pasienC.pekerjaanC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Kabupaten: ",
                                                                                    data: pasienC.kabupatenC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Kecamatan: ",
                                                                                    data: pasienC.kecamatanC.value,
                                                                                  ),
                                                                                  DataPasien(
                                                                                    pasienC: pasienC,
                                                                                    title: "Desa: ",
                                                                                    data: pasienC.desaC.value,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
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
                      )
                    : const LoginValidation();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
