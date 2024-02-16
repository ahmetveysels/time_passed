# Time Passed

This package allows you to make the time used in your application more pleasing in written form. 

## Features

![TimePassed Screenshot](https://ahmetveysel.com/flutterpackages/time_passed/time_passed_screenshot.png)

## Getting started

No permission is needed.

## Usage 

Supported 9 languages: German(de), English(en), Spanish(es), French(fr), Hindi(hi), Portuguese(pt), Russian(ru), Turkish(tr), Chinese(zh) 

Default Language: Device Language

The [dateTime] parameter is required. It is the date time to be compared with the current date time.

The [lang] parameter is optional. device language is accepted by default. If it is set to "en", the function returns the time passed since the given date time in English. If it is set to "tr", the function returns the time passed since the given date time in Turkish. If the language is not included in the package, the default language will be English.

The [passedLimit] parameter is optional. If set, the function returns the elapsed time from the given datetime to the given datetime. If [passedLimit.full=true], it returns the date and time. [passedLimit.full = false] returns only the date.

The [full] parameter is optional. If it is set to true, the function returns the full time passed since the given date time. If it is set to false, the function returns the about time passed since the given date time. The default value is false.

The [shortType] parameter is optional. If set to true, the function returns the elapsed time and returns the units in shorthand. If set to false, the units are returned in long form.

The [customTexts] parameter is optional. If it is set, the function returns the time passed since the given date time using the given custom texts.

#
Please review the example folder


Example Function 1:

```dart
    
    DateTime date = DateTime.now().subtract(const Duration(days: 300, hours: 2, minutes: 30, seconds: 15));

    String timePassed = getTimePassed(date); 

    //10 months ago
    
```
 
Example Function 2:

```dart
    
    DateTime date = DateTime.now().subtract(const Duration(days: 300, hours: 2, minutes: 30, seconds: 15));
    
    String timePassed3 = getTimePassed(date, full: true, shortType: false); 

    // 10 months 2 hours 30 minutes 15 seconds ago
    
```


#
## Additional information

[ahmetveysel.com](https://ahmetveysel.com)
