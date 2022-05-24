import 'package:e_shop/utils/theme.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/values_manager.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p15,right: AppPadding.p15,),
      child: Column(
        children: [
          buildRadioPayment(
            name: 'Paypal',
            image: ImageAssets.paypal,
            onChange: (int ? value){
              setState((){
                radioPaymentIndex = value!;
              });
            },
            scale: 0.7,
            value: 1,
          ),
          const SizedBox(height: AppSize.s10,),
          buildRadioPayment(
            name: 'Paypal',
            image: ImageAssets.google,
            onChange: (int ? value){
              setState((){
                radioPaymentIndex = value!;
              });
            },
            scale: 0.99,
            value: 2,
          ),
          const SizedBox(height: AppSize.s10,),
          buildRadioPayment(
            name: 'Paypal',
            image: ImageAssets.credit,
            onChange: (int ? value){
              setState((){
                radioPaymentIndex = value!;
              });
            },
            scale: 0.7,
            value: 3,
          ),
        ],
      ),
    );
  }
  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
}){
    return Container(
      height: AppSize.s50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, scale: scale,),
              const SizedBox(width: AppSize.s10,),
              TextUtils(
              text: name,
              fontSize: AppSize.s25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            onChanged: (int? value){
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => mainColor,)
          ),
        ],
      ),
    );
  }
}
