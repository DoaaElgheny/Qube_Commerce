import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../api/http/failure.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static ({Failure? failure, Object? data}) mapFailuerOrDone({
    required Either<Failure, Object> either,
  }) {
    Failure? f;
    Object? d;
    either.fold((failure) => f = failure, (data) => d = data);
    return (failure: f, data: d);
  }

  static String? formatDateToString(String? date, {int? addDays}) {
    if (date == null || date.isEmpty) return null;
    if (addDays != null) {
      return DateFormat('yyyy-MM-dd')
          .parse(date)
          .add(Duration(days: addDays))
          .toString()
          .split(' ')
          .first;
    }
    return DateFormat('yyyy-MM-dd').parse(date).toString().split(' ').first;
  }

  static DateTime? formatStringToDateTime(String? date) {
    if (date == null || date.isEmpty) return null;
    final dateTime = DateTime.parse(date);
    return dateTime;
  }

  static Object? getArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments;
  }

  // Calculate the time difference
 static ({int hours, int minutes, int seconds})? calculateTimeDifference(
      {required String date}) {
    final now = DateTime.now();
    final startDate = DateTime.parse(date);
    final isDateAfter = startDate.isAfter(now);
    if (isDateAfter) {
      final difference = now.difference(startDate).abs();
      return (
        hours: difference.inHours,
        minutes: difference.inMinutes.remainder(60),
        seconds: difference.inSeconds.remainder(60)
      );
    }
    return (hours: 0, minutes: 0, seconds: 0);
  }
}
