import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/assets_manager.dart';
import '../../utils/strings_manager.dart';
import '../../utils/theme.dart';
import '../../utils/values_manager.dart';
import '../../view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              ImageAssets.background,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(AppSize.s0_2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSize.s100,
                ),
                Container(
                  height: AppSize.s60,
                  width: AppSize.s190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(AppSize.s0_3),
                    borderRadius: BorderRadius.circular(AppSize.s5),
                  ),
                  child: const Center(
                    child:  TextUtils(
                      text: AppStrings.welcome,
                      color: Colors.white,
                      fontSize: AppSize.s35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Container(
                  height: AppSize.s60,
                  width: AppSize.s230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(AppSize.s0_2),
                    borderRadius: BorderRadius.circular(AppSize.s5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextUtils(
                        text: AppStrings.mfz,
                        color: yellowClr,
                        fontSize: AppSize.s35,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: AppSize.s10,),
                      TextUtils(
                        text: AppStrings.shop,
                        color: Colors.white,
                        fontSize: AppSize.s35,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p40,vertical: AppPadding.p12),

                  ),
                    onPressed: (){
                    Get.offNamed(Routes.loginScreen);
                    // Get.toNamed(Routes.loginScreen);
                    },
                    child: const TextUtils(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s22,
                      color: Colors.white,
                      text: AppStrings.getStart,
                    ),
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                        text: AppStrings.noAccount,
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                    ),
                    TextButton(
                        onPressed: (){
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils(
                          text: AppStrings.signUp,
                          fontSize: AppSize.s18,
                          fontWeight: FontWeight.bold,
                          color: yellowClr,
                          underline: TextDecoration.underline,
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
