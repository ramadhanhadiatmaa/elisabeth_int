import 'package:flutter/material.dart';

import '../../../modules/pasien/controllers/pasien_controller.dart';
import '../../constants/color.dart';
import '../tools/text_widget.dart';

class DataPasien extends StatelessWidget {
  const DataPasien({
    super.key,
    required this.pasienC,
    required this.title,
    required this.data,
  });

  final PasienController pasienC;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
            title: title, color: cBlack, weight: FontWeight.w500, size: 12),
        TextWidget(
            title: data, color: cBlack, weight: FontWeight.w500, size: 12),
      ],
    );
  }
}
