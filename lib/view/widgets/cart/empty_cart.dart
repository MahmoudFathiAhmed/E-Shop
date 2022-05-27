import 'package:e_shop/utils/strings_manager.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/values_manager.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
          size: AppSize.s150,
            color: Get.isDarkMode?Colors.white:Colors.black,
          ),
          const SizedBox(
            height: AppSize.s40,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.yourCartIs.tr,
                  style: TextStyle(
                    color: Get.isDarkMode? Colors.white:Colors.black,
                    fontSize: AppSize.s30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: AppStrings.empty.tr,
                  style: TextStyle(
                    color: Get.isDarkMode? pinkClr:yellowClr,
                    fontSize: AppSize.s30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ),
          ),
          const SizedBox(height: AppSize.s10,),
          Text(
              AppStrings.addItemsToGetStart.tr,
            style: TextStyle(
              color: Get.isDarkMode? Colors.white:Colors.black,
              fontSize: AppSize.s15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50,),
          SizedBox(
            height: AppSize.s50,
            child: ElevatedButton(
                onPressed: (){
                  Get.toNamed(Routes.mainScreen);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  elevation: AppSize.s0,
                  primary: Get.isDarkMode? pinkClr : mainColor,
                ),
                child: Text(
                  AppStrings.goToHome.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppSize.s20
                    ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
