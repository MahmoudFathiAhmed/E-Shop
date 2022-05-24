import 'package:e_shop/logic/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_)=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSize.s6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: languageSettings,
                ),
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: AppSize.s20,),
              TextUtils(
                text: 'Language'.tr,
                fontSize: AppSize.s22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?Colors.white : Colors.black,
              ),
            ],
          ),
        ),
        Container(
          width: AppSize.s120,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6,vertical: AppPadding.p2,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s13),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white:  Colors.black,
              width: AppSize.s2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: AppSize.s25,
              icon: Icon(Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white:  Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  value: ene,
                  child: Text(
                    english,
                    style: const TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: ara,
                  child: Text(arabic,
                    style:  const TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: frf,
                  child: Text(france,
                    style:  const TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              value: controller.langLocal,
              onChanged: (value){
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
            ),
          ),
        ),
      ],
    ),
    );
  }
}
