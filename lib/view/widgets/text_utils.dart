import 'package:flutter/material.dart';

import '../../utils/values_manager.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({Key? key, required this.text, required this.fontSize, required this.fontWeight, required this.color, this.underline= TextDecoration.none}) : super(key: key);
final String text;
final double fontSize;
final FontWeight fontWeight;
final Color color;
final TextDecoration underline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
          color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: underline,
        height: AppSize.s1_2
      ),

    );
  }
}
