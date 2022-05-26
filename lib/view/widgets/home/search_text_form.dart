import 'package:e_shop/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/values_manager.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_)=>TextField(
      controller: controller.searchEditingController,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
      ),
      keyboardType: TextInputType.text,
      onChanged: (searchName){
        controller.addSearchToList(searchName);
      },
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
        suffixIcon: controller.searchEditingController.text.isNotEmpty?
          IconButton(
          onPressed: (){
            controller.clearSearch();
          },
          icon: const Icon(Icons.close, color: Colors.black,),
        ): null,
        hintText: 'Search With name & price',
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(AppSize.s10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(AppSize.s10)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(AppSize.s10)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(AppSize.s10)
        ),
      ),
    ),
    );
  }
}
