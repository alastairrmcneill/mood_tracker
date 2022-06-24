import 'package:flutter/material.dart';
import 'package:mood_tracker/widgets/rating_icons.dart';

class OnboardingIntro extends StatelessWidget {
  const OnboardingIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Text(
            'Mood Tracker',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 30),
          Text(
            'Mental health is important. Understanding what makes you happy and what makes you sad is key to long term happiness. Use Mood tracker to help you reflect on your days',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: RatingIcons.solidIcons,
            ),
          ),
        ],
      ),
    );
  }
}
