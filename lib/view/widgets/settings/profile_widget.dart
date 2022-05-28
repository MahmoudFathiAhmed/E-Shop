import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../logic/controllers/settings_controller.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              width: AppSize.s100,
              height: AppSize.s100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(authController.displayUserPhoto.value),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            const SizedBox(width: AppSize.s15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller.capitalize(authController.displayUserName.value),
                    fontSize: AppSize.s22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    text: authController.displayUserEmail.value,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode? Colors.white : Colors.black,
                  ),
                ],
              ),
            )
          ],
        )),
      ],
    );
  }
}
