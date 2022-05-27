import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shop/logic/controllers/cart_controller.dart';
import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/productDetails/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/routes.dart';
import '../../../utils/values_manager.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> colorSelected= [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
    kColor2,
    kColor3,
    kColor4,
  ];
  int currentPage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason){
              setState((){
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex){
              return Container(
                margin: const EdgeInsets.all(AppSize.s10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(AppSize.s25),
                ),
              );
          },
        ),
        Positioned(
          bottom: AppSize.s30,
            left: AppSize.s180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Get.isDarkMode? pinkClr: mainColor,
                dotColor: Colors.black,
              ),
            ),
        ),
        Positioned(
          bottom: AppSize.s30,
          right: AppSize.s30,
            child: Container(
              height: AppSize.s200,
              width: AppSize.s50,
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppSize.s30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        setState((){
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorSelected[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index)=>const SizedBox(height: AppSize.s3,),
                  itemCount: colorSelected.length,
              ),
            ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: AppPadding.p20,
            left: AppPadding.p25,
            right: AppPadding.p25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode? pinkClr.withOpacity(0.8): mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back_ios_sharp,
                    color: Get.isDarkMode?Colors.black:Colors.white,
                    size: AppSize.s20,
                  ),
                ),
              ),
              Obx(() => Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode? pinkClr.withOpacity(0.8): mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.shopping_cart,
                      color: Get.isDarkMode?Colors.black:Colors.white,
                      size: AppSize.s20,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
