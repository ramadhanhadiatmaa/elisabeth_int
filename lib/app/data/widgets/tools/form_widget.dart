import 'package:flutter/material.dart';

import '../../constants/color.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: cGrey,
            fontSize: 12,
          ),
          prefixIcon: const Icon(
            Icons.bed_outlined,
            color: cRed,
          )),
    );
  }
}
