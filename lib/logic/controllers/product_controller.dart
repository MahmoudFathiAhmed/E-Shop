import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_models.dart';
import '../../services/product_services.dart';
import '../../utils/strings_manager.dart';


class ProductController extends GetxController{
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var storage = GetStorage();
  var isLoading = true.obs;

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchEditingController = TextEditingController();
  @override
  void onInit(){
    super.onInit();
    List? storedShoppings =  storage.read<List>(AppStrings.isFavouritesList);
    if(storedShoppings != null){
      favouritesList = storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts()async{
    var products = await ProductServices.getProduct();
    try{
      isLoading(true);
      if(products.isNotEmpty){
        productList.addAll(products);
      }
    }finally{
  isLoading(false);
  }
}

//logic for favourite screen
  void manageFavourites(int productId)async{
    var existingIndex = favouritesList.indexWhere((element) => element.id == productId);
    if(existingIndex >= 0 ){
      favouritesList.removeAt(existingIndex);
      await storage.remove(AppStrings.isFavouritesList);
    }else{
      favouritesList.add(productList.firstWhere((element) => element.id == productId));
      await storage.write(AppStrings.isFavouritesList, favouritesList);
    }
}

bool isFavourites(int productId){
  return favouritesList.any((element) => element.id == productId);
}

//search Bar Logic
void addSearchToList(String searchName){
    searchName = searchName.toLowerCase();
 searchList.value = productList.where((search) {
   var searchTitle = search.title.toLowerCase();
   var searchPrice = search.price.toString().toLowerCase();
   return searchTitle.contains(searchName)||searchPrice.contains(searchName);
 }).toList();
 update();
}

void clearSearch(){
searchEditingController.clear();
addSearchToList('');
}
}
