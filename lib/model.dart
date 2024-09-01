import 'package:flutter/material.dart';
export 'package:skill_week_0/model.dart';
class  Schedule{
  Schedule({
      required this.time,
      required this.subject,
      required this.description,
      required this.room,
      required this.teacher,
      required this.date
  });

  final String time;
  final String date;
  final String subject;
  final String description;
  final String room;
  final String teacher;

}
