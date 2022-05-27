import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings_manager.dart';
import '../../utils/theme.dart';
import '../../utils/values_manager.dart';
import '../../view/widgets/text_utils.dart';
import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/language_wiget.dart';
import '../widgets/settings/logout_widget.dart';
import '../widgets/settings/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.p24),
        children: [
          ProfileWidget(),
          const SizedBox(height: AppSize.s20,),
          Divider(
            color: Get.isDarkMode? Colors.white : Colors.grey,
            thickness: AppSize.s2,
          ),
          TextUtils(
            text: AppStrings.general.tr,
            fontSize: AppSize.s18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode?pinkClr: mainColor,
          ),
          const SizedBox(height: AppSize.s20,),
          DarkModeWidget(),
          const SizedBox(height: AppSize.s20,),
          LanguageWidget(),
          const SizedBox(height: AppSize.s20,),
          LogoutWidget(),
        ],
      ),
    );
  }
}
