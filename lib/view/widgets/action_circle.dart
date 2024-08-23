import 'package:flutter/material.dart';

class ActionCircle extends StatelessWidget {
  final Function() fun;
  final IconData icon;
  const ActionCircle({super.key, required this.fun, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
