import 'package:e_shop/services/category_services.dart';
import 'package:e_shop/utils/assets_manager.dart';
import 'package:get/get.dart';

import '../../model/product_models.dart';

class CategoryController extends GetxController{

  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    ImageAssets.electronics,
    ImageAssets.jewelry,
    ImageAssets.men,
    ImageAssets.women,
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories()async{
    var categoryName = await CategoryServices.getCategory();
    try{
      isCategoryLoading(true);
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }else{}
    }finally{
      isCategoryLoading(false);
    }
  }

  getAllCategories(String nameCategory) async {
    isAllCategory(true);
    categoryList.value =
    await AllCategoryServices.getAllCategory(nameCategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}