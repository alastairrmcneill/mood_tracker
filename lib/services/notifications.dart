import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0,
      channelKey: 'basic_channel',
      title: 'Don\'t forget to review your day!',
      body: 'This is the body text. Is it needed?',
      notificationLayout: NotificationLayout.Default,
    ),
  );
}

Future<void> createScheduledNotificiation() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'scheduled_channel',
      title: 'Don\'t forget to review your day!',
      body: 'Give a rating to the day and note down what was good or bad about it.',
      notificationLayout: NotificationLayout.Default,
    ),
    schedule: NotificationCalendar(
      repeats: true,
      hour: 10,
      minute: 29,
      second: 0,
      millisecond: 0,
    ),
  );
}

Future<void> cancelAllScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
