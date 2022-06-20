import 'package:animations/animations.dart';
import 'package:date_util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mood_tracker/calendar/blank_day.dart';
import 'package:mood_tracker/calendar/calendar_month_details.dart';
import 'package:mood_tracker/models/review.dart';
import 'calendar_day.dart';
import 'package:intl/intl.dart';

class CalendarMonth extends StatelessWidget {
  List<Widget> calendarDaysReviews = [for (var i = 1; i <= 38; i++) const BlankDay(missedDay: true)];
  final List<Review> reviews;
  late int numberOfEmptyDays;

  CalendarMonth({Key? key, required this.reviews}) : super(key: key);

  List<Widget> buildCalendarDays() {
    numberOfEmptyDays = DateTime(reviews[0].date.year, reviews[0].date.month, 1).weekday - 1;
    for (var i = 0; i <= 37; i++) {
      if (i < numberOfEmptyDays) {
        calendarDaysReviews[i] = const BlankDay(missedDay: false);
      } else if (i >= numberOfEmptyDays + DateUtil().daysInMonth(reviews[0].date.month, reviews[0].date.year)) {
        calendarDaysReviews[i] = const BlankDay(missedDay: false);
      }
    }
    for (var review in reviews) {
      int dateDay = review.date.day;

      calendarDaysReviews[dateDay + numberOfEmptyDays - 1] = CalendarDay(
        review: review,
        showNote: false,
      );
    }

    return calendarDaysReviews;
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      middleColor: Colors.transparent,
      openElevation: 0,
      closedElevation: 0,
      openBuilder: (context, action) => CalendarMonthDetails(reviews: reviews),
      closedBuilder: (context, VoidCallback openContainer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat("MMM").format(reviews[0].date),
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: GridView.count(
              shrinkWrap: false,
              crossAxisCount: 7,
              children: buildCalendarDays(),
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
