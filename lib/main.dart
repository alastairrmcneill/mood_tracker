import 'package:flutter/material.dart';
import 'package:mood_tracker/calendar/calendar_screen.dart';
import 'package:mood_tracker/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme,
      home: CalendarScreen(),
    );
  }
}
