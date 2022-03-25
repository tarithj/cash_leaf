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
  String title;
  String note;
  final tags = <ToOne<Tag>>[];

  int createdTimestamp;

  DateTime getCreatedDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(createdTimestamp);
  }

  Record(
      {this.id = 0,
      required this.amount,
      required this.title,
      required this.note,
      required this.createdTimestamp});

  Record.only({
    this.id = 0,
    this.amount = 0,
    this.title = "",
    this.note = "",
    this.createdTimestamp = 0,
  });
}
