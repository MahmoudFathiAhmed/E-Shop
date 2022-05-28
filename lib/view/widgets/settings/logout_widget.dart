import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_)=>
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              Get.defaultDialog(
                title: AppStrings.logoutFromApp.tr,
                titleStyle: const TextStyle(
                  fontSize: AppSize.s18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                middleText: AppStrings.sureLogout.tr,
                middleTextStyle: const TextStyle(
                  fontSize: AppSize.s18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.grey,
                radius: AppSize.s10,
                textCancel: AppStrings.no.tr,
                cancelTextColor: Colors.white,
                textConfirm: AppStrings.yes.tr,
                confirmTextColor: Colors.white,
                onCancel: (){
                  Get.back();
                },
                onConfirm: (){
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode? pinkClr: mainColor,
              );
            },
            splashColor: Get.isDarkMode? pinkClr.withOpacity(0.4) : mainColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(AppSize.s12),
            customBorder: const StadiumBorder(

            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSize.s6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode?logOutSettings:mainColor,
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.logoutIc,
                    height: AppSize.s28,
                    width: AppSize.s28,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: AppSize.s20,),
                TextUtils(
                  text: AppStrings.logout.tr,
                  fontSize: AppSize.s22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        )
    );
  }
}
