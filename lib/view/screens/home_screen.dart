import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/home/search_text_form.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/values_manager.dart';
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
              Container(
                width: double.infinity,
                height: AppSize.s180,
                decoration:  BoxDecoration(
                  color: Get.isDarkMode? darkGreyClr:mainColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s20),
                    bottomRight: Radius.circular(AppSize.s20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TextUtils(
                          text: 'Find Your',
                          fontSize: AppSize.s25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                      SizedBox(height: AppSize.s5,),
                      TextUtils(
                          text: 'INSPIRATION',
                          fontSize: AppSize.s28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                      SizedBox(height: AppSize.s20,),
                      SearchTextForm(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s10,),
               Padding(
                 padding: const EdgeInsets.only(left: AppPadding.p20),
                 child: Align(
                   alignment: Alignment.topLeft,
                   child: TextUtils(
                    text: 'Categories',
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.w500 ,
                    color: Get.isDarkMode? Colors.white:Colors.black,
              ),
                 ),
               ),
              const SizedBox(height: AppSize.s30,),
              CardItems(),

            ],
          ),
        ),
    );
  }
}
