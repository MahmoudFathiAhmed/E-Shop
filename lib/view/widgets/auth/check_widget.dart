import 'package:e_shop/logic/controllers/auth_controller.dart';

import '../../../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(
              height: AppSize.s35,
              width: AppSize.s35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              child: controller.isCheckBox? Get.isDarkMode?Image.asset(ImageAssets.check):const Icon(Icons.done, color: pinkClr, size: AppSize.s30,):Container(),
            ),
          ),
          const SizedBox(width:AppSize.s10),
          Row(
            children:  [
              TextUtils(
                text: AppStrings.iAccept.tr,
                fontSize: AppSize.s16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              TextUtils(
                text: AppStrings.termsAndConditions.tr,
                fontSize: AppSize.s16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode?Colors.white:Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}
