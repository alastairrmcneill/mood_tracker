import 'package:date_util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mood_tracker/calendar/blank_day.dart';
import 'calendar_day.dart';

class CalendarMonth extends StatelessWidget {
  List<Widget> calendarDays = [for (var i = 1; i <= 37; i++) const BlankDay()];
  final List<DateTime> dates;
  late int numberOfEmptyDays;

  CalendarMonth({Key? key, required this.dates}) : super(key: key);

  List<Widget> buildCalendarDays() {
    numberOfEmptyDays = dates[0].weekday - 1;
    for (var date in dates) {
      int dateDay = date.day;

      calendarDays[dateDay + numberOfEmptyDays - 1] = CalendarDay(day: dateDay);
    }

    return calendarDays;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: buildCalendarDays(),
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
