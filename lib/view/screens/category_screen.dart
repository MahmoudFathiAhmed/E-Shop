import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/product_controller.dart';
import '../../utils/values_manager.dart';
import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: AppSize.s15, top: AppSize.s20),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: AppSize.s30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          CategoryWidget(),
        ],
      ),
    );
  }
}
