import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';
import 'package:mood_tracker/calendar/calendar_year.dart';
import 'package:mood_tracker/services/notifications.dart';
import 'package:mood_tracker/services/reviews_database.dart';
import 'package:mood_tracker/models/review.dart';
import 'package:mood_tracker/review/add_review.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<List<Review>> calendarYearsReviews = [[]];
  late List<Review> reviews;
  late int firstYear;
  int _pageIndex = 0;
  bool isLoading = false;
  bool todayComplete = false;

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    // Get Reviews
    refreshReviews();
  }

  Future refreshReviews() async {
    setState(() => isLoading = true);

    reviews = await ReviewsDatabase.instance.readAllReviews();

    if (reviews.isNotEmpty) {
      firstYear = reviews[0].date.year;

      for (var review in reviews) {
        if (calendarYearsReviews.length <= review.date.year - firstYear) {
          calendarYearsReviews.add([]);
        }
        calendarYearsReviews[review.date.year - firstYear].add(review);
      }
      DateTime now = DateTime.now();
      DateTime nowDay = DateTime(now.year, now.month, now.day);
      DateTime then = reviews.last.date;
      DateTime thenDay = DateTime(then.year, then.month, then.day);
      todayComplete = thenDay == nowDay;
    }

    setState(() => isLoading = false);
  }

  List<Widget> buildYears() {
    List<Widget> years = [];

    for (var i = 0; i < calendarYearsReviews.length; i++) {
      years.add(CalendarYear(reviews: calendarYearsReviews[i], year: calendarYearsReviews[i][0].date.year));
    }
    // return calendarYearsReviews.map((year) => CalendarYear(reviews: year)).toList();
    return years;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).textTheme.headline5!.color,
              )
            : (reviews.isEmpty)
                ? Center(
                    child: Text(
                    'Track your first day',
                    style: Theme.of(context).textTheme.headline5,
                  ))
                : Column(
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AnimatedSmoothIndicator(
                          activeIndex: _pageIndex,
                          count: calendarYearsReviews.length,
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
                        ),
                      )
                    ],
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddReview(todayComplete: todayComplete)),
          );

          refreshReviews();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
