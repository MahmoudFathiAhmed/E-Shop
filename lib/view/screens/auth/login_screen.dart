import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/my_string.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/theme.dart';
import '../../../utils/values_manager.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              fontSize: AppSize.s28,
                              fontWeight: FontWeight.w500,
                              text: AppStrings.log,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            const SizedBox(
                              width: AppSize.s3,
                            ),
                            TextUtils(
                              fontSize: AppSize.s28,
                              fontWeight: FontWeight.w500,
                              text: AppStrings.lin,
                              color:
                              Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s50,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return AppStrings.inValidEmail;
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
                              : Image.asset(ImageAssets.email),
                          suffixIcon: const Text(""),
                          hintText: AppStrings.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                              controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < AppSize.s6) {
                                  return AppStrings.invalidPassword;
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? const Icon(
                                Icons.lock,
                                color: pinkClr,
                                size: AppSize.s30,
                              )
                                  : Image.asset(ImageAssets.lock),
                              hintText: AppStrings.password,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                                    : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                              ), keyboardType: TextInputType.visiblePassword,
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: AppStrings.isForgotPassword,
                              fontSize: AppSize.s14,
                              color:
                              Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                controller.logInUsingFirebase(
                                    email: email, password: password);
                              }
                            },
                            text: AppStrings.login,
                          );
                        }),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        TextUtils(
                          fontSize: AppSize.s18,
                          fontWeight: FontWeight.w500,
                          text: AppStrings.or,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.faceBookSignUpApp();
                              },
                              child: Image.asset(
                                ImageAssets.facebook,
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s10,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSinUpApp();
                                },
                                child: Image.asset(
                                  ImageAssets.google,
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: AppStrings.noAccount,
                textType: AppStrings.signUp,
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
