import 'package:flutter/material.dart';
import 'package:mood_tracker/models/review.dart';

class CalendarDay extends StatelessWidget {
  final Review review;
  final List<Color> colors = const [
    Color(0xffff5999),
    Color(0xFFff70a6),
    Color(0xFFff70a6),
    Color(0xff3daeb4),
    Color(0xFF109da4),
    Color(0xFF0e838a),
  ];
  late Color color;
  CalendarDay({Key? key, required this.review}) {
    color = colors[review.rating - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: color,
    );
  }
}
