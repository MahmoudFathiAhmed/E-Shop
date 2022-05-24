import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../../utils/values_manager.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payment_method_widget.dart';
import '../widgets/text_utils.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        elevation: AppSize.s0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: AppSize.s24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode? Colors.white:Colors.black,
                text: 'Shipping To',
              ),
              const SizedBox(height: AppSize.s20,),
              DeliveryContainerWidget(),
              const SizedBox(height: AppSize.s20,),
              TextUtils(
                fontSize: AppSize.s24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode? Colors.white:Colors.black,
                text: 'Payment Method',
              ),
              const SizedBox(height: AppSize.s20,),
              PaymentMethodWidget(),
              const SizedBox(height: AppSize.s30,),
              Center(
                child: TextUtils(
                  text: 'Total: 200\$',
                  fontSize: AppSize.s22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode? Colors.white:Colors.black,
                ),
              ),
              const SizedBox(height: AppSize.s20,),
              Center(
                child: SizedBox(
                  height: AppSize.s50,
                  width: AppSize.s150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      elevation: AppSize.s0,
                      primary: Get.isDarkMode?pinkClr : mainColor,
                    ),
                    onPressed: (){},
                    child:
                        const Text('Pay Now',
                          style: TextStyle(
                              fontSize: AppSize.s22,
                              color: Colors.white
                          ),
                        ),
                    ),
                  ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
