import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';
import 'package:mood_tracker/calendar/calendar_year.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CalendarScreen extends StatefulWidget {
  List<List<Review>> calendarYearsReviews = [[]];
  final List<Review> reviews = reviewsData;
  late int firstYear;

  CalendarScreen({Key? key}) : super(key: key) {
    firstYear = reviews[0].date.year;

    for (var review in reviews) {
      if (calendarYearsReviews.length <= review.date.year - firstYear) {
        calendarYearsReviews.add([]);
      }
      calendarYearsReviews[review.date.year - firstYear].add(review);
    }
  }

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _pageIndex = 0;
  List<Widget> buildYears() {
    return widget.calendarYearsReviews.map((year) => CalendarYear(reviews: year)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                  });
                },
                children: buildYears(),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: _pageIndex,
              count: widget.calendarYearsReviews.length,
              onDotClicked: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              effect: const WormEffect(
                activeDotColor: Color(0xFFeecac4),
                dotColor: Color(0xFF4a4b53),
                dotHeight: 6,
                dotWidth: 6,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add),
      ),
    );
  }
}


// https://stackoverflow.com/questions/57165310/create-a-datetime-column-in-sqlite-flutter-database
