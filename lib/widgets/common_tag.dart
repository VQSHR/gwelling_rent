import 'dart:math';

import 'package:flutter/material.dart';

List<Color?> colors = [
  Colors.red,
  Colors.green,
  Colors.blue
];
List<Color?> backgroundColors = [
  Colors.red[50],
  Colors.green[50],
  Colors.blue[50]
];

class CommonTag extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;

  const CommonTag.origin(
    this.title, {
    Key? key,
    this.color = Colors.black,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  factory CommonTag(String title) {
    var rand = Random().nextInt(3);
    return CommonTag.origin(
      title,
      color: colors[rand],
      backgroundColor: backgroundColors[rand],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          color: color,
        ),
      ),
    );
  }
}
