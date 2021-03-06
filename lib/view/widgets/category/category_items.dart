import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/category_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../../model/product_models.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../screens/product_details_screen.dart';
import '../text_utils.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: AppSize.s0_8,
              mainAxisSpacing: AppSize.s9,
              crossAxisSpacing: AppSize.s6,
              maxCrossAxisExtent: AppSize.s200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                      productModels: categoryController.categoryList[index],
                    ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: AppSize.s3,
                blurRadius: AppSize.s2,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavourites(productId)
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                    memCacheHeight: AppCount.c200,
                    memCacheWidth: AppCount.c140,
                  fit: BoxFit.fitHeight,
                ),
                // Image.network(
                //   image,
                //   fit: BoxFit.fitHeight,
                // )

              ),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p15, top: AppPadding.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: AppSize.s20,
                      width: AppSize.s45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p3, right: AppPadding.p2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: AppSize.s13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.star,
                              size: AppSize.s13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}