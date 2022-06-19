import 'package:flutter/material.dart';

class BlankDay extends StatelessWidget {
  const BlankDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.blue,
      ),
    );
  }
}
