import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode?pinkClr:mainColor,
          minimumSize: const Size(AppSize.s360, AppSize.s50)),
      onPressed: onPressed,
      child: TextUtils(
          text: text,
          fontSize: AppSize.s18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
      ),
    );
  }
}
