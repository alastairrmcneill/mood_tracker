import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_screen.dart';
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
              isLastPage = index == 2;
            });
          },
          children: [
            Container(color: Colors.blue, child: Center(child: Text('Page 1'))),
            Container(color: Colors.red, child: Center(child: Text('Page 2'))),
            Container(color: Colors.green, child: Center(child: Text('Page 3'))),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CalendarScreen()));
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
              },
              child: const Text('Get Started'),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: Size.fromHeight(80)),
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
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Color(0xFFeecac4),
                      dotColor: Color(0xFF4a4b53),
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
