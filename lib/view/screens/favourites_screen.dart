
import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/assets_manager.dart';
import '../../utils/strings_manager.dart';
import '../../utils/values_manager.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
      if(controller.favouritesList.isEmpty){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s100,
                width: AppSize.s100,
                child: SvgPicture.asset(ImageAssets.addFavouritesIc,
                  color: Get.isDarkMode?pinkClr:mainColor,
                ),
              ),
              const SizedBox(height: AppSize.s20,),
              Text(AppStrings.pleaseAddYourFavouriteProducts.tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    fontSize: AppSize.s18
                ),
              ),
            ],
          ),
        );
      }else{
        return ListView.separated(
          itemBuilder: (context, index){
            return buildFavItems(
              image: controller.favouritesList[index].image,
              price: controller.favouritesList[index].price,
              title: controller.favouritesList[index].title,
              productId: controller.favouritesList[index].id,
            );
          },
          separatorBuilder: (context, index){
            return const Divider(
              color: Colors.grey,
              thickness: AppSize.s1,
            );
          },
          itemCount: controller.favouritesList.length,
        );
      }
      }
      ),
    );

  }
  Widget buildFavItems(
  {
  required String image,
  required double price,
  required String title,
  required int productId,
}
      ){
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  side: BorderSide(
                    color: Get.isDarkMode?pinkClr:mainColor,
                    width: AppSize.s2,
                    style: BorderStyle.solid
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(image,
                  fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                  style: TextStyle(
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  ),
                  const SizedBox(height: AppSize.s10,),
                  Text('\$ $price',
                  style: TextStyle(
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: (){
                  controller.manageFavourites(productId);
                },
                icon: const Icon(Icons.favorite, color: Colors.red,size: AppSize.s30,),
            )
          ],
        ),
      ),
    );
  }
}
