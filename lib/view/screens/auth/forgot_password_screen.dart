import '../../../utils/assets_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/values_manager.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: AppSize.s0,
          title: Text(
            AppStrings.forgotPassword.tr,
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    AppStrings.recoverAccount.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  Image.asset(
                    ImageAssets.forgotPass,
                    width: AppSize.s250,
                  ),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return AppStrings.inValidEmail.tr;
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                      Icons.email,
                      color: pinkClr,
                      size: AppSize.s30,
                    )
                        : const Icon(
                      Icons.email,
                      color: mainColor,
                      size: AppSize.s30,),
                    suffixIcon: const Text(""),
                    hintText: AppStrings.email.tr,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email);
                        }
                      },
                      text: AppStrings.send.tr,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
