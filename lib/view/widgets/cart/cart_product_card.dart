import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/model/product_models.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index ;
  final int quantity;
  CartProductCard({Key? key, required this.productModels, required this.index, required this.quantity}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s130,
      width: AppSize.s100,
      margin: const EdgeInsets.only(left: AppMargin.m20,right: AppMargin.m20, top: AppMargin.m5,),
      decoration: BoxDecoration(
      color: Get.isDarkMode?pinkClr.withOpacity(0.7): mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(AppSize.s20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppSize.s120,
            width: AppSize.s100,
            margin: const EdgeInsets.only(left: AppMargin.m15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s20),
              image: DecorationImage(
                image: NetworkImage(productModels.image,),
                fit: BoxFit.contain,
              )
            ),
          ),
          const SizedBox(width: AppSize.s20,),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModels.title,
                style: TextStyle(
                  color: Get.isDarkMode? Colors.white: Colors.black,
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                ),
                const SizedBox(height: AppSize.s20,),
                Text('\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                style: TextStyle(
                  color: Get.isDarkMode? Colors.white: Colors.black,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                 IconButton(
                     onPressed: (){
                       controller.removeProductsFromCart(productModels);
                     },
                     icon:  Icon(Icons.remove_circle,
                     color: Get.isDarkMode?Colors.white:Colors.black,
                     ),
                 ),
                 Text(
                     '$quantity',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: AppSize.s16,
                     fontWeight: FontWeight.bold,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                 IconButton(
                     onPressed: (){
                       controller.addProductToCart(productModels);
                     },
                     icon: Icon(Icons.add_circle,
                       color: Get.isDarkMode?Colors.white:Colors.black,
                     ),
                 ),
                ],
              ),
              IconButton(
                onPressed: (){
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                    Icons.delete,
                  color: Get.isDarkMode?Colors.black:Colors.red,
                  size: AppSize.s20,

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
