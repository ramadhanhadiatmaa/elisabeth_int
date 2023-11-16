import 'package:flutter/material.dart';

import '../../../modules/bed/controllers/bed_controller.dart';
import '../../constants/color.dart';
import '../tools/button_widget.dart';
import '../tools/form_widget.dart';

class BedSection extends StatelessWidget {
  const BedSection({
    super.key,
    required this.bedC,
  });

  final BedController bedC;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cWhite,
      child: Center(
        child: SizedBox(
          width: 300,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "NICU",
                controller: bedC.markusnicu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "VVIP",
                controller: bedC.markusvvip,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "VIP",
                controller: bedC.markusvip,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 1 LUKAS",
                controller: bedC.lukas,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 1 MARIA",
                controller: bedC.maria,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 2 FRANSISKUS",
                controller: bedC.fransiskus,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 2 MATIUS",
                controller: bedC.matius,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 2 TERESIA",
                controller: bedC.teresia,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 3 YOSEF",
                controller: bedC.yosef,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 3 TERESIA",
                controller: bedC.teresiatiga,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 3 EGIDIO",
                controller: bedC.egidio,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "KELAS 3 KLARA",
                controller: bedC.klara,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormWidget(
                label: "ISOLASI",
                controller: bedC.yohanes,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
                title: "UPDATE",
                color: cBlue,
                press: () {
                  bedC.updateDataId();
                }),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
