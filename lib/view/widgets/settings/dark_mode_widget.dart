import 'package:e_shop/logic/controllers/settings_controller.dart';
import 'package:e_shop/logic/controllers/theme_controller.dart';
import 'package:e_shop/utils/assets_manager.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/strings_manager.dart';
import '../../../utils/values_manager.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
          activeTrackColor: Get.isDarkMode? pinkClr:  mainColor,
          activeColor: Get.isDarkMode? pinkClr:  mainColor,
          value: controller.switchValue.value,
          onChanged: (value){
            ThemeController().changesTheme();
            controller.switchValue.value = value;
          },
        ),
      ],
    ));
  }
  Widget buildIconWidget(){
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSize.s6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.isDarkMode?darkSettings:mainColor,
            ),
            child: SvgPicture.asset(
              ImageAssets.darkModeIc,
              height: AppSize.s28,
              width: AppSize.s28,
              color: Colors.white,
            ),
            // const Icon(
            //   Icons.dark_mode,
            //   color: Colors.white,
            // ),
          ),
          const SizedBox(width: AppSize.s20,),
          TextUtils(
            text: AppStrings.darkMode.tr,
            fontSize: AppSize.s22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode?Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
