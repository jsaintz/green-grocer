// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:green_grocer/src/constants/constants.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;
  const AppNameWidget({
    Key? key,
    this.greenTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(color: greenTitleColor ?? Constants.customSwatchColor),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(color: Constants.customContrastColor),
          ),
        ],
      ),
    );
  }
}
