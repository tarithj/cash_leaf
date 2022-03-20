int timestampOfDayStart(int year, int month, int day) {
  return DateTime(year, month, day).millisecondsSinceEpoch;
}

int timestampOfDayEnd(int year, int month, int day) {
  return DateTime(year, month, day, 23, 60, 60, 1000).millisecondsSinceEpoch;
}

/// The [weekday] may be 0 for Sunday, 1 for Monday, etc. up to 7 for Sunday.
int timeStampOfTheStartOfTheWeek(DateTime date, int weekday) =>
    DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7).millisecondsSinceEpoch;

/// The [weekday] may be 0 for Sunday, 1 for Monday, etc. up to 7 for Sunday.
int timeStampOfTheEndOfTheWeek(DateTime date, int weekday) =>
    DateTime(date.year, date.month, date.day + (date.weekday - weekday) % 7).millisecondsSinceEpoch;
