import 'package:flutter/material.dart';

class CategorySellector extends StatelessWidget {
  final String image;
  final Function() fun;
  final bool select;
  const CategorySellector(
      {super.key,
      required this.image,
      required this.fun,
      required this.select});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Stack(
        children: [
          Image.asset(
            image,
            width: 50.0,
            height: 50.0,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey.withOpacity(select ? 0.0 : 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
