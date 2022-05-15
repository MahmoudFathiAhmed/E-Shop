import 'package:flutter/material.dart';

import '../../../utils/values_manager.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFormField({
    Key? key,
    required this.controller,
    this.obscureText=false,
    required this.validator,
    required this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon=const Text(''),
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      validator: (value)=>validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),

      ),
    );
  }
}
