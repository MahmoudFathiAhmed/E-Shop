import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/values_manager.dart';
import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Card Items'),
          centerTitle: true,
          elevation: AppSize.s0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.s560,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          productModels:
                              controller.productsMap.keys.toList()[index],
                          index: index,
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: AppSize.s20,
                      ),
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppPadding.p30,
                    ),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
