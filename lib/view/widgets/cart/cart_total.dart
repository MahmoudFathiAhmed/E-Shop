import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.all(AppPadding.p25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextUtils(
                text: AppStrings.total.tr,
                fontSize: AppSize.s16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text(
                '\$${controller.total}',
                style: TextStyle(
                    color: Get.isDarkMode? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s20,
                    height: 1.5
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSize.s20,),
          Expanded(
            child: SizedBox(
              height: AppSize.s60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  elevation: AppSize.s0,
                  primary: Get.isDarkMode?pinkClr : mainColor,
                ),
                onPressed: (){
                  Get.toNamed(Routes.paymentScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(AppStrings.checkOut.tr,
                      style: const TextStyle(
                          fontSize: AppSize.s20,
                          color: Colors.white
                      ),
                    ),
                    const SizedBox(width: AppSize.s10,),
                    const Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
