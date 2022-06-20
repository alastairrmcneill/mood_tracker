import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';
import 'package:mood_tracker/models/review.dart';

class CalendarYear extends StatelessWidget {
  final int year;
  final List<Review> reviews;
  List<List<Review>> calendarMonthsReviews = [for (var i = 0; i <= 11; i++) []];
  late int firstMonth;
  CalendarYear({Key? key, required this.reviews, required this.year}) : super(key: key) {
    // firstMonth = reviews[0].date.month;
    for (var review in reviews) {
      // if (calendarMonthsReviews.length <= review.date.month - firstMonth) {
      //   for (int i = 0; i < review.date.month - firstMonth; i++) {
      //     calendarMonthsReviews.add([]);
      //   } // create as many columns as needed
      // }
      calendarMonthsReviews[review.date.month - 1].add(review);
    }
  }

  List<Widget> buildMonths() {
    List<Widget> months = [];

    for (var i = 0; i < calendarMonthsReviews.length; i++) {
      months.add(CalendarMonth(reviews: calendarMonthsReviews[i], year: year, month: i + 1));
    }
    // return calendarMonthsReviews.map((month) => CalendarMonth(reviews: month, month: 1)).toList();

    if (DateTime.now().year == year) {
      months.length = months.length - (12 - DateTime.now().month);
    }
    return months;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            '$year',
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
