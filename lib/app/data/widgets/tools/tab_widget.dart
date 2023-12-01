import 'package:flutter/material.dart';

import '../../constants/color.dart';
import 'text_widget.dart';

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
