import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';

class CalendarYear extends StatelessWidget {
  final List<DateTime> dates;
  List<List<DateTime>> calendarMonths = [[]];
  CalendarYear({Key? key, required this.dates}) : super(key: key) {
    for (var date in dates) {
      if (calendarMonths.length < date.month) {
        calendarMonths.add([]);
      }
      calendarMonths[date.month - 1].add(date);
    }
  }

  List<Widget> buildMonths() {
    return calendarMonths.map((month) => CalendarMonth(dates: month)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      children: buildMonths(),
    );
  }
}
