library time_passed;

import 'dart:io';

import 'package:time_passed/src/functions/get_current_texts.dart';
import 'package:time_passed/src/model/passed_limit_model.dart';
import 'package:time_passed/src/model/time_passed_model.dart';

/// This function returns the time passed since the given date time.
///
/// The [dateTime] parameter is required. It is the date time to be compared with the current date time.
///
/// The [lang] parameter is optional. device language is accepted by default. If it is set to "en", the function returns the time passed since the given date time in English. If it is set to "tr", the function returns the time passed since the given date time in Turkish. If the language is not included in the package, the default language will be English.
///
/// The [passedLimit] parameter is optional. If set, the function returns the elapsed time from the given datetime to the given datetime. If [passedLimit.full=true], it returns the date and time. [passedLimit.full = false] returns only the date.
///
/// The [full] parameter is optional. If it is set to true, the function returns the full time passed since the given date time. If it is set to false, the function returns the about time passed since the given date time. The default value is false.
///
/// The [shortType] parameter is optional. If set to true, the function returns the elapsed time and returns the units in shorthand. If set to false, the units are returned in long form.
///
/// The [customTexts] parameter is optional. If it is set, the function returns the time passed since the given date time using the given custom texts.

String getTimePassed(DateTime dateTime,
    {String? lang,
    PassedLimitModel? passedLimit,
    bool full = false,
    bool shortType = false,
    TimePassedTextsModel? customTexts}) {
  try {
    Duration diffDate = DateTime.now().difference(dateTime);
    if (passedLimit != null) {
      if (diffDate.inSeconds > passedLimit.duration.inSeconds) {
        if (passedLimit.full) {
          return "${dateTime.day.toString().padLeft(2, "0")}.${dateTime.month.toString().padLeft(2, "0")}.${dateTime.year} ${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}";
        } else {
          return "${dateTime.day.toString().padLeft(2, "0")}.${dateTime.month.toString().padLeft(2, "0")}.${dateTime.year}";
        }
      }
    }

    String lang2 = lang ?? Platform.localeName.split("_")[0].split("-")[0];
    // print("lang2: $lang2");
    TimePassedTextsModel currentText = customTexts ?? getCurrentTexts(lang2);

    DateTime now = DateTime.now();
    DateTime ago = dateTime;
    Duration dur = now.difference(ago);
    int days = dur.inDays;
    int years = days ~/ 365;
    int months = (days - (years * 365)) ~/ 30;
    int weeks = (days - (years * 365 + months * 30)) ~/ 7;
    int rdays = days - (years * 365 + months * 30 + weeks * 7).toInt();
    int hours = (dur.inHours % 24).toInt();
    int minutes = (dur.inMinutes % 60).toInt();
    int seconds = (dur.inSeconds % 60).toInt();

    Map<String, int> diff = {
      "y": years,
      "m": months,
      "w": weeks,
      "d": rdays,
      "h": hours,
      "i": minutes,
      "s": seconds
    };

    String strYear = diff["y"] == null ? "0" : diff["y"].toString();
    String strMonth = diff["m"] == null ? "0" : diff["m"].toString();
    String strWeek = diff["w"] == null ? "0" : diff["w"].toString();
    String strDay = diff["d"] == null ? "0" : diff["d"].toString();
    String strHour = diff["h"] == null ? "0" : diff["h"].toString();
    String strMinute = diff["i"] == null ? "0" : diff["i"].toString();
    String strSecond = diff["s"] == null ? "0" : diff["s"].toString();

    ///Ago or Just Now
    String strLastText = "";

    // for Years Text
    if (strYear == "0") {
      strYear = "";
    } else if (shortType) {
      strYear += currentText.yearShort;
    } else if (years == 1) {
      strYear += " ${currentText.yearLong}";
    } else if (years > 1) {
      strYear += " ${currentText.yearsLong}";
    }

    // for Months Text
    if (strMonth == "0") {
      strMonth = "";
    } else if (shortType) {
      strMonth += currentText.monthShort;
    } else if (months == 1) {
      strMonth += " ${currentText.monthLong}";
    } else if (months > 1) {
      strMonth += " ${currentText.monthsLong}";
    }

    // for Weeks Text
    if (strWeek == "0") {
      strWeek = "";
    } else if (shortType) {
      strWeek += currentText.weekShort;
    } else if (weeks == 1) {
      strWeek += " ${currentText.weekLong}";
    } else if (weeks > 1) {
      strWeek += " ${currentText.weeksLong}";
    }

    // for Days Text
    if (strDay == "0") {
      strDay = "";
    } else if (shortType) {
      strDay += currentText.dayShort;
    } else if (rdays == 1) {
      strDay += " ${currentText.dayLong}";
    } else if (rdays > 1) {
      strDay += " ${currentText.daysLong}";
    }

    // for Hours Text
    if (strHour == "0") {
      strHour = "";
    } else if (shortType) {
      strHour += currentText.hourShort;
    } else if (hours == 1) {
      strHour += " ${currentText.hourLong}";
    } else if (hours > 1) {
      strHour += " ${currentText.hoursLong}";
    }

    // for Minutes Text
    if (strMinute == "0") {
      strMinute = "";
    } else if (shortType) {
      strMinute += currentText.minuteShort;
    } else if (minutes == 1) {
      strMinute += " ${currentText.minuteLong}";
    } else if (minutes > 1) {
      strMinute += " ${currentText.minutesLong}";
    }

    // for Seconds Text
    if (strSecond == "0") {
      strSecond = "";
    } else if (shortType) {
      strSecond += currentText.secondShort;
    } else if (seconds == 1) {
      strSecond += " ${currentText.secondLong}";
    } else if (seconds > 1) {
      strSecond += " ${currentText.secondsLong}";
    }

    if (strYear.isEmpty &&
        strMonth.isEmpty &&
        strWeek.isEmpty &&
        strDay.isEmpty &&
        strHour.isEmpty &&
        strMinute.isEmpty &&
        seconds < 50) {
      if (full) {
        strLastText = currentText.ago;
      } else {
        strSecond = "";
        strLastText = currentText.now;
      }
    } else {
      strLastText = currentText.ago;
    }

    String returnedText = "";

    if (full) {
      returnedText =
          "$strYear $strMonth $strWeek $strDay $strHour $strMinute $strSecond $strLastText ";
    } else {
      if (strYear.isNotEmpty) {
        returnedText = strYear;
      } else if (strMonth.isNotEmpty) {
        returnedText = strMonth;
      } else if (strWeek.isNotEmpty) {
        returnedText = strWeek;
      } else if (strDay.isNotEmpty) {
        returnedText = strDay;
      } else if (strHour.isNotEmpty) {
        returnedText = strHour;
      } else if (strMinute.isNotEmpty) {
        returnedText = strMinute;
      } else if (strSecond.isNotEmpty) {
        returnedText = strSecond;
      }
      returnedText += " $strLastText";
    }

    while (returnedText.contains("  ")) {
      returnedText = returnedText.replaceAll("  ", " ");
    }

    return returnedText.replaceAll("  ", " ").trim();
  } catch (e) {
    print("getTimePassed error: $e");
    return "nn";
  }
}
