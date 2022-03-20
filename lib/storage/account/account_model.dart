
import 'package:cash_leaf/common/timestamps.dart';
import 'package:cash_leaf/storage/account/record.dart';
import 'package:cash_leaf/storage/app.dart';
import 'package:flutter/cupertino.dart';

import '../../objectbox.g.dart';

class AccountModel extends ChangeNotifier {
  String get currencySuffix => preferenceBox.getCurrencySuffix() ?? "";
  set currencySuffix(String suffix) {
    preferenceBox.setCurrencySuffix(suffix);
    notifyListeners();
  }

  List<Record> get records => objectbox.store.box<Record>().getAll();

  Iterable<Record> getRecordsWithTitleContainsString(String string) {
    return objectbox.store.box<Record>().query(
        Record_.title.contains(string)
    ).build().find();
  }

  Iterable<Record> getRecordsOnDay(int year, int month, int day) {
    return objectbox.store.box<Record>().query(
        Record_.createdTimestamp.between(timestampOfDayStart(year, month, day), timestampOfDayEnd(year, month, day))
    ).build().find();
  }


  double getSumOfTransactionOnWeek(DateTime dateTime) {
    var records = getRecordsOnWeek(dateTime);
    var sum = 0.0;
    for (var record in records) {
      sum += record.amount;
    }
    return sum;
  }

  Iterable<Record> getRecordsOnWeek(DateTime dateTime) {
    return objectbox.store.box<Record>().query(
        Record_.createdTimestamp.between(timeStampOfTheStartOfTheWeek(dateTime, 1), timeStampOfTheEndOfTheWeek(dateTime, 1))
    ).build().find();
  }

  void addRecord(Record record) {
    objectbox.store.box<Record>().put(record);
    notifyListeners();
  }

  void removeRecord(int id) {
    objectbox.store.box<Record>().remove(id);
    notifyListeners();
  }
}
