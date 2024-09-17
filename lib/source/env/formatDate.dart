import 'package:intl/intl.dart';

String formatDate(DateTime time) {
  final now = DateTime.now();
  final formattedTime = DateFormat('yyyy MMM dd').format(
    DateTime(now.year, now.month, now.day, time.hour, time.minute),
  );
  return formattedTime;
}