import 'package:flutter/material.dart';
import 'package:try_again/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;
  final String hint;
  final IconData icon;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.onTap,
      required this.hint,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      validator: (String? val) {
        if (val!.isEmpty) {
          return "Empty";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(10.0),
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Icon(
            icon,
            color: AppColors.primaryColor,
          )),
    );
  }
}
