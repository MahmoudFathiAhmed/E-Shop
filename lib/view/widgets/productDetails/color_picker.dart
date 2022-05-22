import 'package:e_shop/utils/values_manager.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  const ColorPicker({Key? key, required this.outerBorder, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder?Border.all(color: color, width: AppSize.s2): null,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p15),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
        ),
      ),
    );
  }
}
