import 'package:flutter/material.dart';

import '../../../utils/values_manager.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
        hintText: 'Search you\'r looking for',
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: AppSize.s12,
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
    );
  }
}
