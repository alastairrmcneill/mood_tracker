import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';
import 'package:mood_tracker/models/review.dart';

class CalendarYear extends StatelessWidget {
  final List<Review> reviews;
  List<List<Review>> calendarMonthsReviews = [[]];
  late int firstMonth;
  CalendarYear({Key? key, required this.reviews}) : super(key: key) {
    firstMonth = reviews[0].date.month;
    for (var review in reviews) {
      if (calendarMonthsReviews.length < review.date.month - firstMonth) {
        calendarMonthsReviews.add([]);
      }
      calendarMonthsReviews[review.date.month - firstMonth].add(review);
    }
  }

  List<Widget> buildMonths() {
    return calendarMonthsReviews.map((month) => CalendarMonth(reviews: month)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            '${reviews[0].date.year}',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisSpacing: 15,
              childAspectRatio: 0.85,
              crossAxisCount: 2,
              physics: ClampingScrollPhysics(),
              children: buildMonths(),
            ),
          ),
        ],
      ),
    );
  }
}
