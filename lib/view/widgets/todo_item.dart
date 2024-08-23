import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title, category ;
  final bool complete;
  final Function(bool ? val) onClicked;
  const TodoItem(
      {super.key,
      required this.title,
      required this.category,
      required this.complete, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    String imagePath;

    if (category == "study") {
      imagePath = "assets/images/Category.png";
    } else if (category == "work") {
      imagePath = "assets/images/Category2.png";
    } else {
      imagePath = "assets/images/Category1.png";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 50.0,
            height: 50.0,
            opacity: AlwaysStoppedAnimation(
              complete? 0.5 : 1.0
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
           Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: complete ? Colors.grey : Colors.black,
                decoration: complete ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          Checkbox(
            value: complete,
            onChanged: onClicked,
          ),
        ],
      ),
    );
  }
}
