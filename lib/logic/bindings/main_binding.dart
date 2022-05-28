import 'package:get/instance_manager.dart';

import '../../logic/controllers/main_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController(), permanent: true);
  }
}