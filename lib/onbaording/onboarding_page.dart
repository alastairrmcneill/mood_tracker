import 'package:flutter/material.dart';
import 'package:mood_tracker/theme.dart';

class OnboardingPage extends StatelessWidget {
  final String text;
  final String imagePath;
  const OnboardingPage({Key? key, required this.text, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
