import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings_manager.dart';
import '../../utils/theme.dart';
import '../../utils/values_manager.dart';
import '../../view/widgets/home/search_text_form.dart';
import '../../view/widgets/text_utils.dart';
import '../widgets/home/card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              const SizedBox(height: AppSize.s10),
              Container(
                width: double.infinity,
                height: AppSize.s185,
                decoration:  BoxDecoration(
                  color: Get.isDarkMode? darkGreyClr:mainColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s20),
                    bottomRight: Radius.circular(AppSize.s20),
                    topLeft: Radius.circular(AppSize.s20),
                    topRight: Radius.circular(AppSize.s20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(height: AppSize.s14),
                       TextUtils(
                          text: AppStrings.discover.tr,
                          fontSize: AppSize.s25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                      const SizedBox(height: AppSize.s5,),
                       TextUtils(
                          text: AppStrings.uniqueProducts.tr,
                          fontSize: AppSize.s28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                      const SizedBox(height: AppSize.s20,),
                      SearchTextForm(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s20,),
              CardItems(),
              const SizedBox(height: AppSize.s20,),
            ],
          ),
        ),
    );
  }
}
