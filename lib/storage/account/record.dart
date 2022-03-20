import 'package:cash_leaf/common/currency.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Tag {

  int id;
  String name;
  final records = <ToOne<Record>>[];

  Tag({this.id = 0, required this.name});
}


@Entity()
class Record {
  int id;
  double amount;
  int effect;
  String title;
  String note;
  final tags = <ToOne<Tag>>[];

  int createdTimestamp;

  DateTime getCreatedDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(createdTimestamp);
  }

  String getEffectSign() {
    String effectSign = "";
    switch (effect) {
      case effectNegative:
        effectSign = "-";
        break;
      case effectPositive:
        effectSign = "+";
        break;
    }
    return effectSign;
  }

  Record({
      this.id = 0,
      required this.amount,
      this.effect = effectUnknown,
      required this.title,
      required this.note,
      required this.createdTimestamp
  });

  Record.only({
    this.id = 0,
    this.amount = 0,
    this.effect = effectNegative,
    this.title = "",
    this.note = "",
    this.createdTimestamp = 0,
  });
}