import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/values_manager.dart';

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
              const TextUtils(
                text: 'Total',
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
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Check Out',
                      style: TextStyle(
                          fontSize: AppSize.s20,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(width: AppSize.s10,),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
