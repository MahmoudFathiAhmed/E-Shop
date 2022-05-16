import 'package:get/instance_manager.dart';
import '../../logic/controllers/main_controller.dart';
// import '../../logic/controllers/payment_controller.dart';
// import '../../logic/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    // Get.put(SettingController());
    // Get.put(PayMentController(), permanent: true);
  }
}