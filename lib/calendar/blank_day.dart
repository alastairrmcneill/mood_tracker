import 'package:flutter/material.dart';

class BlankDay extends StatelessWidget {
  final bool missedDay;
  const BlankDay({Key? key, required this.missedDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: missedDay ? const Color(0xFF4f5d6a) : Colors.transparent,
    );
  }
}
