import 'package:flutter/material.dart';

class CustomText1 extends StatelessWidget {
  final String text;
  const CustomText1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
