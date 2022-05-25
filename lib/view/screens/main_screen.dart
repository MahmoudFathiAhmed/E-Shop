import 'package:badges/badges.dart';
import 'package:e_shop/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../logic/controllers/main_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../../utils/values_manager.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
            () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSize.s10))
              ),
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                      () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child:
                    IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: SvgPicture.asset(ImageAssets.shoppingCartIc,
                        color: Colors.white,
                        height: AppSize.s50,
                        width: AppSize.s50,
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
            ),
            bottomNavigationBar: Container(
              decoration:  BoxDecoration(
                borderRadius:  const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s30),
                  topLeft: Radius.circular(AppSize.s30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode?Colors.grey.shade700:Colors.black38,
                    spreadRadius: AppSize.s0,
                    blurRadius: Get.isDarkMode?AppSize.s5: AppSize.s10,
                    blurStyle: BlurStyle.solid,
                  ),
                ]
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s30),
                  topLeft: Radius.circular(AppSize.s30),
                ),
                child: BottomNavigationBar(
                  // backgroundColor: darkGreyClr,
                  selectedItemColor: Get.isDarkMode ? Colors.white : Colors.black,
                  backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
                  currentIndex: controller.currentIndex.value,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        ImageAssets.homeIc,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        width: AppSize.s28,
                        height: AppSize.s28,
                      ),
                      icon: SvgPicture.asset(
                        ImageAssets.homeIc,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: AppSize.s23,
                        height: AppSize.s23,
                      ),
                      // activeIcon: Icon(
                      //   Icons.home,
                      //   color: Get.isDarkMode ? pinkClr : mainColor,
                      //   size: AppSize.s28,
                      // ),
                      // icon: Icon(
                      //   Icons.home,
                      //   color: Get.isDarkMode ? Colors.white : Colors.black,
                      // ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        ImageAssets.categoriesIc,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        width: AppSize.s28,
                        height: AppSize.s28,
                      ),
                      icon: SvgPicture.asset(
                        ImageAssets.categoriesIc,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: AppSize.s23,
                        height: AppSize.s23,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        ImageAssets.favouritesIc,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        width: AppSize.s28,
                        height: AppSize.s28,
                      ),
                      icon: SvgPicture.asset(
                        ImageAssets.favouritesIc,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: AppSize.s23,
                        height: AppSize.s23,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        ImageAssets.settingsIc,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        width: AppSize.s28,
                        height: AppSize.s28,
                      ),
                      icon: SvgPicture.asset(
                        ImageAssets.settingsIc,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        width: AppSize.s23,
                        height: AppSize.s23,
                      ),
                      label: '',
                    ),
                  ],
                  onTap: (index) {
                    controller.currentIndex.value = index;
                  },
                ),
              ),
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
