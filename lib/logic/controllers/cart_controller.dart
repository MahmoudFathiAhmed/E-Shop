import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_models.dart';
import '../../routes/routes.dart';
import '../../utils/strings_manager.dart';
import '../../utils/theme.dart';
import '../../utils/values_manager.dart';

class CartController extends GetxController{
  var productsMap = {}.obs;



  void addProductToCart(ProductModels productModels){
    if(productsMap.containsKey(productModels)){
      productsMap[productModels] += 1;
    }else{
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels){
    if(productsMap.containsKey(productModels) && productsMap[productModels] == 1){
      productsMap.removeWhere((key, value) => key == productModels);
    }else{
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels){
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts(){
    Get.defaultDialog(
      title: AppStrings.clearProducts.tr,
      titleStyle: const TextStyle(
        fontSize: AppSize.s18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: AppStrings.sureClearing.tr,
      middleTextStyle: const TextStyle(
        fontSize: AppSize.s18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: AppSize.s10,
      textCancel: AppStrings.no.tr,
      cancelTextColor: Colors.white,
      textConfirm: AppStrings.yes.tr,
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: (){
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode? pinkClr: mainColor,
    );
  }

  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);
  int quantity (){
    if(productsMap.isEmpty){
      return 0;
    }else{
    return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value+element);
    }
  }
}