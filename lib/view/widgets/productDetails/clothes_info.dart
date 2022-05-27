import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/strings_manager.dart';
import '../../../utils/values_manager.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
   ClothesInfo({Key? key, required this.title, required this.productId, required this.rate, required this.description}) : super(key: key);

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p25,
        vertical: AppPadding.p10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                style: TextStyle(
                  fontSize: AppSize.s20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                ),
              ),
              Obx(() => Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: Get.isDarkMode? Colors.white.withOpacity(0.9):
                  Colors.grey.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    controller.manageFavourites(productId);
                  },
                  child: controller.isFavourites(productId)? const Icon(Icons.favorite,
                    color: Colors.red,
                    size: AppSize.s20,
                  ):const Icon(Icons.favorite_outline,
                    color: Colors.black,
                    size: AppSize.s20,
                  ),
                ),
              )),
            ],
          ),
          const SizedBox(width: AppSize.s8,),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white: Colors.black),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) =>const Icon(Icons.star,
                color: Colors.orangeAccent,
                ),
                itemCount: AppCount.c5,
                itemSize: AppSize.s20,
                itemPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p1),

              ),
            ],
          ),
          const SizedBox(height: AppSize.s20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: AppStrings.showMore.tr,
            trimExpandedText: AppStrings.showLess.tr,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? pinkClr:mainColor
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? pinkClr:mainColor
            ),
            style: TextStyle(
              fontSize: AppSize.s16,
              height: AppSize.s2,
              color: Get.isDarkMode? Colors.white:Colors.black,
            ),

          ),
        ],
      ),
    );
  }
}
