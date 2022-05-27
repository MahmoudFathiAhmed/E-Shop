import 'package:get/get.dart';
import '../../view/screens/category_screen.dart';
import '../../view/screens/favourites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/settings_screen.dart';
import '../../utils/strings_manager.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeScreen(),
    CategoryScreen(),
    FavouritesScreen(),
    const SettingsScreen(),
  ].obs;

  var title = [
    AppStrings.mfzShop.tr,
    AppStrings.categories.tr,
    AppStrings.favourites.tr,
    AppStrings.settings.tr,
  ].obs;
}