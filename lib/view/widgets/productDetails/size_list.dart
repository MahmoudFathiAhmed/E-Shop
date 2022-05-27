import 'package:e_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/values_manager.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXl'];
  var currentSelected = AppCount.c0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25, vertical: AppPadding.p10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              setState((){
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15, vertical: AppPadding.p10),
              decoration: BoxDecoration(
                color: Get.isDarkMode?
                currentSelected ==index?
                pinkClr.withOpacity(AppSize.s0_4):Colors.black:
                currentSelected ==index?
                mainColor.withOpacity(AppSize.s0_4):Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s15),
                border: Border.all(
                  color: Colors.grey.withOpacity(AppSize.s0_4),
                  width: AppSize.s2,
                ),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                    color: Get.isDarkMode?
                    currentSelected == index? Colors.white:Colors.white:
                    currentSelected == index? Colors.black:Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index)=>const SizedBox(width: AppSize.s10,),
        itemCount: sizeList.length,
      ),
    );
  }
}
