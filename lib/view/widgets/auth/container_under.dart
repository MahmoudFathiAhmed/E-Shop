import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder({Key? key, required this.text, required this.onPressed, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode?mainColor:pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20),
          topRight: Radius.circular(AppSize.s20),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: AppSize.s20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                text: textType,
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
          )
        ],
      ),
    );
  }
}
