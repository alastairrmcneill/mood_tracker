import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mood_tracker/calendar/calendar_month.dart';
import 'package:mood_tracker/calendar/calendar_year.dart';

class CalendarScreen extends StatelessWidget {
  List<List<DateTime>> calendarYears = [[]];
  late int firstYear;
  final List<DateTime> dates = [
    DateTime(2021, 1, 1),
    DateTime(2021, 1, 2),
    DateTime(2021, 1, 3),
    DateTime(2021, 1, 4),
    DateTime(2021, 1, 5),
    DateTime(2021, 1, 6),
    DateTime(2021, 1, 7),
    DateTime(2021, 1, 8),
    DateTime(2021, 1, 9),
    DateTime(2022, 1, 10),
    DateTime(2022, 1, 11),
    DateTime(2022, 1, 12),
    DateTime(2022, 1, 13),
    DateTime(2022, 1, 14),
    DateTime(2022, 1, 15),
    DateTime(2022, 1, 16),
    DateTime(2022, 1, 17),
    DateTime(2022, 1, 18),
    DateTime(2022, 1, 19),
    DateTime(2022, 1, 20),
    DateTime(2022, 1, 21),
    DateTime(2022, 1, 22),
    DateTime(2022, 1, 23),
    DateTime(2022, 1, 24),
    DateTime(2022, 1, 25),
    DateTime(2022, 1, 26),
    DateTime(2022, 1, 27),
    DateTime(2022, 1, 28),
    DateTime(2022, 1, 29),
    DateTime(2022, 1, 30),
    DateTime(2022, 1, 31),
    DateTime(2022, 2, 1),
    DateTime(2022, 2, 2),
    DateTime(2022, 2, 3),
    DateTime(2022, 2, 4),
    DateTime(2022, 2, 5),
    DateTime(2022, 2, 6),
    DateTime(2022, 2, 7),
    DateTime(2022, 2, 8),
    DateTime(2022, 2, 9),
    DateTime(2022, 2, 10),
    DateTime(2022, 2, 11),
    DateTime(2022, 2, 12),
    DateTime(2022, 2, 13),
    DateTime(2022, 2, 14),
    DateTime(2022, 3, 15),
    DateTime(2022, 3, 16),
    DateTime(2022, 3, 17),
    DateTime(2022, 3, 18),
    DateTime(2022, 3, 19),
  ];
  CalendarScreen({Key? key}) : super(key: key) {
    firstYear = dates[0].year;

    for (var date in dates) {
      if (calendarYears.length <= date.year - firstYear) {
        calendarYears.add([]);
      }
      calendarYears[date.year - firstYear].add(date);
    }
  }

  List<Widget> buildYears() {
    return calendarYears.map((year) => CalendarYear(dates: year)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: buildYears(),
      ),
    );
  }
}


// https://stackoverflow.com/questions/57165310/create-a-datetime-column-in-sqlite-flutter-database
