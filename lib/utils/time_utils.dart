import 'package:flutter/material.dart';

bool checkUpdateTime(TimeOfDay lastUpdateTime) {
  TimeOfDay updateTime = getNextUpdate(lastUpdateTime);
  return timeToDouble(TimeOfDay.now()) < timeToDouble(updateTime);
}

TimeOfDay getNextUpdate(TimeOfDay lastUpdateTime) {
  List<TimeOfDay> updateTimes = [
    const TimeOfDay(hour: 06, minute: 00),
    const TimeOfDay(hour: 12, minute: 00),
    const TimeOfDay(hour: 17, minute: 00),
    const TimeOfDay(hour: 23, minute: 00),
  ];
  double lastDouble = timeToDouble(lastUpdateTime);
  for (TimeOfDay element in updateTimes) {
    double upDouble = timeToDouble(element);
    if (lastDouble <= upDouble) {
      return element;
    }
  }
  return const TimeOfDay(hour: 06, minute: 00);
}

double timeToDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
