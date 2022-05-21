import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/theme_controller.dart';
import '../../utils/values_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (){
                ThemeController().changesTheme();
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                color: Get.isDarkMode? Colors.white:Colors.black
              ),
              ),
            ),
            const SizedBox(height: AppSize.s20,),
            GetBuilder<AuthController>(
              builder: (controller){
                return TextButton(
                  onPressed: (){
                    Get.defaultDialog(
                      title: "Log Out from App",
                      titleStyle: const TextStyle(
                        fontSize: AppSize.s18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      middleText: 'Are you sure you need to logout?',
                      middleTextStyle: const TextStyle(
                        fontSize: AppSize.s18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey,
                      radius: AppSize.s10,
                      textCancel: " NO ",
                      cancelTextColor: Colors.white,
                      textConfirm: " YES ",
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
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Get.isDarkMode? Colors.white:Colors.black
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
