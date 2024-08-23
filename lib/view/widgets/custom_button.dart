import 'package:flutter/material.dart';
import 'package:try_again/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() fun;
  const CustomButton({super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: MaterialButton(
        onPressed: fun,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
