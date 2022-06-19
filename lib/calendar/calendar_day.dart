import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final int day;
  const CalendarDay({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.red,
        child: Text(
          day.toString(),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
