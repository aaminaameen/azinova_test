import 'package:azinova/presentation/style/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({super.key, 
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorPalette.grey.withOpacity(.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: ColorPalette.black.withOpacity(.5),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: ColorPalette.black.withOpacity(.5),
          fontWeight: FontWeight.w500,
        ),
      ),
      validator: validator,
    );
  }
}
