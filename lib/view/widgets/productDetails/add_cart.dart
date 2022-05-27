import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/model/product_models.dart';
import 'package:e_shop/utils/strings_manager.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/utils/values_manager.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
   AddCart({Key? key, required this.price, required this.productModels}) : super(key: key);

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: AppStrings.price.tr,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
              ),
              Text('\$$price',
              style: TextStyle(
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
                height: AppSize.s1_5
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
                  primary: Get.isDarkMode? pinkClr:mainColor,
                ),
                onPressed: (){
                  controller.addProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.addToCart.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: AppSize.s20,
                      ),
                    ),
                    const SizedBox(width: AppSize.s10,),
                    const Icon(Icons.shopping_cart_outlined,

                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
