export 'package:skill_week_0/model.dart';
import 'dart:convert';

List<Schedule> FromJson(String str) => List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

class Schedule {
  String time;
  String date;
  String subject;
  String description;
  String room;
  String teacher;

  Schedule({
    required this.time,
    required this.date,
    required this.subject,
    required this.description,
    required this.room,
    required this.teacher,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    time: json["time"],
    date: json["date"],
    subject: json["subject"],
    description: json["description"],
    room: json["room"],
    teacher: json["teacher"],
  );
}
