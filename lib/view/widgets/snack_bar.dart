import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String text;
  final Color color;
  const CustomSnackBar({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: color,
    );
  }
}
