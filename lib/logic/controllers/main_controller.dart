import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../view/screens/category_screen.dart';
import '../../view/screens/favourites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/settings_screen.dart';
import '../../utils/strings_manager.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    AppStrings.mfzShop,
    AppStrings.categories,
    AppStrings.favourites,
    AppStrings.settings,
  ].obs;
}