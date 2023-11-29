// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  CategoryIcon({super.key, required this.category, this.size = 24.0});
  final String category;
  double? size;

  @override
  Widget build(BuildContext context) {
    IconData categoryIcon = Icons.fastfood;
    Color? iconColor;
    switch (category) {
      case "Food":
        categoryIcon = Icons.fastfood;
        iconColor = Colors.green[400];
        break;
      case "Travel":
        categoryIcon = Icons.flight;
        iconColor = Colors.orange[400];
        break;
      case "Shopping":
        categoryIcon = Icons.shopping_bag;
        iconColor = Colors.blue[400];
        break;
    }
    return Container(
      decoration: BoxDecoration(
        color: iconColor?.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          categoryIcon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
