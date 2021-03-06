import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';
import '../../utils/strings_manager.dart';

class SettingsController extends GetxController{
var switchValue = false.obs;
var storage = GetStorage();
var langLocal = ene;

String capitalize(String profileName){
  return profileName.split(" ").map((name) => name.capitalize).join(" ");
}

//language

  @override
  void onInit() async {
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLanguage(String lang)async{
    await storage.write(AppStrings.lang, lang );
  }
  Future <String>get getLanguage async{
    return await storage.read(AppStrings.lang);
  }
  void changeLanguage(String languageCode){
    saveLanguage(languageCode);
    if (langLocal == languageCode) {
      return;
    }

    if (languageCode == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
}
}