import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../logic/controllers/payment_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {

  final TextEditingController  phoneController = TextEditingController();
  int radioContainerIndex = 1;
  bool changeColors = false;

  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: "Egypt, Menofia, Ashmoun",
          color: changeColors ? Colors.white : Colors.grey.shade300,
          title: 'M F Z Store',
          name: 'mahmoud fathi',
          onChanged: (int? value){
            setState((){
              radioContainerIndex = value!;
              changeColors = !changeColors;
            });
          },
          phone: '010-123-456-78',
          value: 1,
          icon: Container(),
        ),
        const SizedBox(height: AppSize.s10,),
        Obx(() => buildRadioContainer(
          address: controller.address.value,
          color: changeColors ? Colors.grey.shade300: Colors.white,
          title: AppStrings.delivery.tr,
          name: authController.displayUserName.value,
          phone: controller.phoneNumber.value,
          value: 2,
          icon: InkWell(
            onTap: (){
              Get.defaultDialog(
                  title: AppStrings.enterYourPhoneAddress.tr,
                  titleStyle: const TextStyle(
                    fontSize: AppSize.s16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: AppSize.s10,
                  buttonColor: Get.isDarkMode?pinkClr:mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(AppSize.s15),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      maxLength: AppCount.c11,
                      onSubmitted: (value){
                        phoneController.text = value;
                      },
                      decoration:  InputDecoration(
                        fillColor: Get.isDarkMode?pinkClr.withOpacity(0.1):mainColor.withOpacity(0.1),
                        focusColor: Colors.red,
                        prefixIcon: Icon(Icons.phone, color: Get.isDarkMode?pinkClr: mainColor,),
                        suffixIcon:
                        IconButton(
                          onPressed: (){
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close, color: Colors.black,),
                        ),
                        hintText: AppStrings.enterYourPhoneAddress.tr,
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: AppSize.s12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(AppSize.s10)
                        ),
                      ),
                    ),
                  ),
                  textCancel: AppStrings.cancel.tr,
                  cancelTextColor: Colors.black,
                  textConfirm: AppStrings.save.tr,
                  confirmTextColor: Colors.white,
                  onCancel: (){
                    Get.toNamed(Routes.paymentScreen);
                  },
                  onConfirm: (){
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  }
              );
            },
            child: Icon(Icons.contact_phone,
              size: AppSize.s20,
              color: Get.isDarkMode? pinkClr:mainColor,
            ),
          ),
          onChanged: (int? value){
            setState((){
              radioContainerIndex = value!;
              changeColors = !changeColors;
            });
            controller.updatePosition();
          },
        ),
        ),
      ],
    );
  }
  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }){
    return Container(
      height: AppSize.s120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: color,
        boxShadow:
        [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: AppSize.s3,
            blurRadius: AppSize.s3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value){
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(width: AppSize.s10,),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: AppSize.s20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: AppSize.s5,),
                TextUtils(
                  text: name,
                  fontSize: AppSize.s15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: AppSize.s5,),
                Row(
                  children: [
                    const Text('🇪🇬+02 '),
                    TextUtils(
                      text: phone,
                      fontSize: AppSize.s15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    const SizedBox(width: AppSize.s110,),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s5,),
                TextUtils(
                  text: address,
                  fontSize: AppSize.s15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
