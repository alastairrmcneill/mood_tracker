import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mood_tracker/calendar/calendar_screen.dart';
import 'package:mood_tracker/onbaording/onboarding.dart';
import 'package:mood_tracker/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  AwesomeNotifications().initialize(
    'resource://drawable/app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Basic Notificataion Description',
        defaultColor: MyColors.rating5,
        importance: NotificationImportance.High,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        channelDescription: 'Scheduled Notificataion Description',
        defaultColor: MyColors.rating5,
        locked: true,
        importance: NotificationImportance.High,
      ),
    ],
  );

  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme,
      home: showHome ? CalendarScreen() : OnboardingScreen(),
    );
  }
}
