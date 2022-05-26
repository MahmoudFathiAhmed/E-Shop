import '../../../logic/controllers/category_controller.dart';
import '../../../view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();


  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        if (controller.isCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                      categoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: AppSize.s150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      border: Border.all(
                        color: Get.isDarkMode?pinkClr:mainColor,
                        width: AppSize.s2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          controller.imageCategory[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p20, bottom: AppPadding.p10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNameList[index],
                          style:  TextStyle(
                            backgroundColor: Colors.black38,
                            color: Get.isDarkMode?pinkClr:yellowClr,
                            fontSize: AppSize.s22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: AppSize.s20,
                );
              },
              itemCount: controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}