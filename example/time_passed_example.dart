import 'package:time_passed/src/model/passed_limit_model.dart';
import 'package:time_passed/time_passed.dart';

void main() {
  DateTime date = DateTime.now()
      .subtract(const Duration(days: 300, hours: 2, minutes: 30, seconds: 15));

  String timePassed = getTimePassed(date);
  //10 months ago

  String timePassed2 = getTimePassed(date, full: false, shortType: true);
  //10mo ago

  String timePassed3 = getTimePassed(date, full: true, shortType: false);
  // 10 months 2 hours 30 minutes 15 seconds ago

  String timePassed4 = getTimePassed(date, full: false, shortType: false);
  // 10 months ago

  String timePassed5 = getTimePassed(date, full: true, shortType: true);
  // 10mo 2h 30min 15s ago

  String timePassed6 = getTimePassed(date,
      passedLimit:
          PassedLimitModel(duration: const Duration(days: 250), full: true));
  // 19.04.2023 21:04

  String timePassed7 = getTimePassed(date,
      passedLimit:
          PassedLimitModel(duration: const Duration(days: 250), full: false));
  // 19.04.2023

  String timePassed8 =
      getTimePassed(date, full: true, shortType: false, lang: "tr");
  // 10 ay 2 saat 30 dakika 15 saniye önce

  print(timePassed);
  print(timePassed2);
  print(timePassed3);
  print(timePassed4);
  print(timePassed5);
  print(timePassed6);
  print(timePassed7);
  print(timePassed8);
}
