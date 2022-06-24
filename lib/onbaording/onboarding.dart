import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_screen.dart';
import 'package:mood_tracker/onbaording/onboarding_intro.dart';
import 'package:mood_tracker/onbaording/onboarding_page.dart';
import 'package:mood_tracker/services/notifications.dart';
import 'package:mood_tracker/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OboardingScreenState();
}

class _OboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _pageController,
          physics: const ClampingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 4;
            });
          },
          children: const [
            OnboardingIntro(),
            OnboardingPage(text: 'Add a review with a rating and a note', imagePath: 'assets/Page0.png'),
            OnboardingPage(text: 'Review your year as a whole to see trends', imagePath: 'assets/Page1.png'),
            OnboardingPage(text: 'Zoom in to see a specific month. Click the days marked with a dot', imagePath: 'assets/Page2.png'),
            OnboardingPage(text: 'Read your note from that day as reminder', imagePath: 'assets/Page3.png'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CalendarScreen()));
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                createScheduledNotificiation();
              },
              child: const Text('Get Started'),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: const Size.fromHeight(80)),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: const Text('Skip')),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 5,
                    effect: WormEffect(
                      activeDotColor: MyColors.dotOn,
                      dotColor: MyColors.dotOff,
                      dotHeight: 6,
                      dotWidth: 6,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: const Text('Next')),
                ],
              ),
            ),
    );
  }
}
