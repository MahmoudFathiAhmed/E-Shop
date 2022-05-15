import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../../view/widgets/text_utils.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();
   SignUpScreen({Key? key}) : super(key: key);

   final formKey = GlobalKey<FormState>();

   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

   // final controller = Get.put(AuthController());



   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode? Colors.white: darkGreyClr,
          elevation: AppSize.s0,
        ),
        backgroundColor: Get.isDarkMode? Colors.white: darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / AppSize.s1_3,
                child:  Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p25,
                    right: AppPadding.p25,
                    top: AppPadding.p40,
                    bottom: AppPadding.p40,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            TextUtils(
                              text: AppStrings.sign,
                              fontSize: AppSize.s28,
                              fontWeight: FontWeight.bold,
                              color: Get.isDarkMode? mainColor : pinkClr,
                            ),
                            const SizedBox(width: AppSize.s3,),
                            TextUtils(
                              text: AppStrings.up,
                              fontSize: AppSize.s28,
                              fontWeight: FontWeight.bold,
                              color: Get.isDarkMode? Colors.black: Colors.white,
                            ),

                          ],
                        ),
                        const SizedBox(height: AppSize.s50,),
                        AuthTextFormField(
                          controller: nameController,
                          validator: (value){
                            if( value.toString().length <= 2 || !RegExp(validationName).hasMatch(value) ){
                              return AppStrings.inValidName;
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          prefixIcon: Get.isDarkMode?Image.asset(ImageAssets.user):const Icon(Icons.person,color: pinkClr,size: AppSize.s30,),
                          hintText: AppStrings.userName,
                        ),
                        const SizedBox(height: AppSize.s20,),
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value){
                            if(!RegExp(validationEmail).hasMatch(value)){
                              return AppStrings.inValidEmail;
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Get.isDarkMode?Image.asset(ImageAssets.email):const Icon(Icons.email,color: pinkClr,size: AppSize.s30,),
                          hintText: AppStrings.email,
                        ),
                        const SizedBox(height: AppSize.s20,),
                        GetBuilder<AuthController>(
                            builder: (_){
                              return AuthTextFormField(
                                controller: passwordController,
                                validator: (value){
                                  if(value.toString().length<=6){
                                    return AppStrings.invalidPassword;
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Get.isDarkMode?Image.asset(ImageAssets.lock):const Icon(Icons.lock,color: pinkClr,size: AppSize.s30,),
                                obscureText: controller.isVisibility?false:true,
                                hintText: AppStrings.password,
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility? const Icon(Icons.visibility_off, color: Colors.black,)
                                      : const Icon(Icons.visibility, color: Colors.black,),
                                ),
                              );
                            },
                        ),
                        const SizedBox(height: AppSize.s50,),
                        CheckWidget(),
                        const SizedBox(height: AppSize.s50,),
                        AuthButton(
                          text: AppStrings.signUp,
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: (){
                  Get.offNamed(Routes.loginScreen);
                },
                text: AppStrings.haveAccount,
                textType: AppStrings.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
