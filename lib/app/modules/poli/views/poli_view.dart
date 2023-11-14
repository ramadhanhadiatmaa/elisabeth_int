import 'package:elisabeth_int/app/data/constants/color.dart';
import 'package:elisabeth_int/app/data/widgets/tools/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/poli_controller.dart';

class PoliView extends GetView<PoliController> {
  PoliView({Key? key}) : super(key: key);

  final poliC = Get.put(PoliController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal Poli'),
          centerTitle: true,
          backgroundColor: cRed,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
        ),
        body: Container(
          color: cWhite,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Obx(() => ListView.builder(
                  itemCount: poliC.poliList.length,
                  itemBuilder: (context, index) {
                    return PoliDataWidget(
                      kodePoli: poliC.poliList[index].kodePoli,
                      nama: poliC.poliList[index].nama,
                      dokter: poliC.poliList[index].dokter,
                      status: poliC.poliList[index].status,
                      color: (poliC.poliList[index].status == "Buka")
                          ? cBlue
                          : cRed,
                    );
                  },
                )),
          ),
        ));
  }
}

class PoliDataWidget extends StatelessWidget {
  PoliDataWidget({
    super.key,
    required this.kodePoli,
    required this.nama,
    required this.dokter,
    required this.status,
    required this.color,
  });

  final String kodePoli;
  final String nama;
  final String dokter;
  final String status;
  final Color color;

  final poliC = Get.put(PoliController());

  final TextEditingController namaC = TextEditingController();
  final TextEditingController statC = TextEditingController();

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
                width: 50,
                child: TextWidget(
                  title: kodePoli,
                  color: cBlack,
                  weight: FontWeight.w700,
                  size: 16,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                child: TextWidget(
                  title: "Poli $nama",
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  backgroundColor: cBlue,
                ),
                onPressed: () {
                  Get.bottomSheet(Container(
                    height: 400,
                    color: cWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 500,
                            child: TextField(
                              autocorrect: false,
                              controller: namaC,
                              keyboardType: TextInputType.text,
                              maxLength: 200,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: "Nama Dokter",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 500,
                            child: TextField(
                              autocorrect: false,
                              controller: statC,
                              keyboardType: TextInputType.text,
                              maxLength: 200,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: "Status Poli",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
                },
                child: const TextWidget(
                  title: "UPDATE",
                  color: cWhite,
                  weight: FontWeight.w500,
                  size: 14,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
