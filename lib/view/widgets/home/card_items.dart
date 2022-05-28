import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/model/product_models.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/utils/values_manager.dart';
import 'package:e_shop/view/screens/product_details_screen.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../utils/assets_manager.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoading.value){
        return  Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode? pinkClr:mainColor,
          ),
        );
      }else{
        return Expanded(
          child: controller.searchList.isEmpty &&
              controller.searchEditingController.text.isNotEmpty?
              SizedBox(
                height: AppSize.s100,
                width: AppSize.s100,
                child: SvgPicture.asset(ImageAssets.noResultsIc,
                  color: Get.isDarkMode?pinkClr:mainColor,
                ),
              ):
          GridView.builder(
              itemCount: controller.searchList.isEmpty?
              controller.productList.length:
              controller.searchList.length,
              gridDelegate: const  SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: AppSize.s0_8,
                mainAxisSpacing: AppSize.s9,
                crossAxisSpacing: AppSize.s6,
                maxCrossAxisExtent: AppSize.s200,
              ),
              itemBuilder: (context, index){
                if(controller.searchList.isEmpty){
                  return buildCardItems(
                      image: controller.productList[index].image,
                      price: controller.productList[index].price,
                      rate: controller.productList[index].rating.rate,
                      productId: controller.productList[index].id,
                      productModels: controller.productList[index],
                      onTap: (){
                        Get.to(()=>ProductDetailsScreen(
                          productModels: controller.productList[index],
                        ));
                      }
                  );
                }else{
                  return buildCardItems(
                      image: controller.searchList[index].image,
                      price: controller.searchList[index].price,
                      rate: controller.searchList[index].rating.rate,
                      productId: controller.searchList[index].id,
                      productModels: controller.searchList[index],
                      onTap: (){
                        Get.to(()=>ProductDetailsScreen(
                          productModels: controller.searchList[index],
                        ));
                      }
                  );
                }
              }
          ),
        );
      }
    });
  }
   Widget buildCardItems(
       {
         required String image,
         required double price,
         required double rate,
         required int productId,
         required ProductModels productModels,
         required Function() onTap,
 }
      ){
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
            ]
          ),
          child: Column(
            children: [
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      controller.manageFavourites(productId);
                    },
                    icon: controller.isFavourites(productId)? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ): const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
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
                height: AppSize.s140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: Image.network(image,
                fit: BoxFit.fitHeight,
                ),

              ),
              const SizedBox(height: AppSize.s7,),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p15,right: AppPadding.p15, top: AppPadding.p5, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextUtils(
                      text: '\$$price',
                      color:Colors.black ,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s13,
                    ),
                    Container(
                      height: AppSize.s20,
                      width: AppSize.s45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode?pinkClr:mainColor,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p3, right: AppPadding.p2,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                text: '$rate',
                                fontSize: AppSize.s13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                            const Icon(Icons.star,size: AppSize.s13,
                            color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
