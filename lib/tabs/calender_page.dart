import 'dart:convert';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:skill_week_0/model.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:http/http.dart' as http;
import '../widgets/schedule_card.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    super.key,
    required this.date,
  });
  final String date;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final ScrollController scrollController = ScrollController();

  List<Schedule> schedules = [];
  late Future<void> _scheduleFuture;
  @override
  void initState() {
    super.initState();
    _scheduleFuture = getSchedule();
  }

  Future<void> getSchedule() async {
    try {
      var response = await http.get(Uri.https('scheduleapi-7rkx.onrender.com', '/API/get'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          schedules = (jsonData as List).map<Schedule>((data) {
            return Schedule(
              time: data['time'] ?? '',
              subject: data['subject'] ?? '',
              description: data['description'] ?? '',
              room: data['room'] ?? '',
              teacher: data['teacher'] ?? '',
              date: data['date'] ?? '',
            );
          }).toList();
        });
      } else {
        // Handle server errors or unexpected response status
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors like network issues
      print('Error fetching schedule: $e');
    }
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DateTime currentDate = DateTime.now();
    String weekday = DateFormat('EEEE').format(currentDate);
    String monthYear = DateFormat('MMM yyyy').format(currentDate);

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            currentDate.day.toString(),
                            style: const TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 5),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weekday,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffBCC1CD),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                               Text(
                                monthYear,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffBCC1CD),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              color: const Color(0xff4DC591).withOpacity(0.1),
                              child: const Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4DC591),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    EasyDateTimeLine(
                      initialDate: DateTime.now().subtract(const Duration(days: 3)),
                      activeColor: const Color(0xffFF7648),
                      dayProps: const EasyDayProps(
                        height: 62,
                        width: 40,
                        dayStructure: DayStructure.dayStrDayNum,
                        activeDayStyle: DayStyle(
                          dayNumStyle: TextStyle(color: Colors.white),
                          dayStrStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      headerProps: const EasyHeaderProps(
                        showHeader: false,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: screenWidth * 0.05),
                          const Text(
                            'Time',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBCC1CD),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.1),
                          const Text(
                            'Course',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBCC1CD),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage('lib/assets/icons/filter.png'),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<void>(
                      future: _scheduleFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (schedules.isEmpty) {
                            return const Center(
                                child: Text('No schedules available.'));
                          }
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: SizedBox(
                              height: screenHeight,
                              child: ListView.builder(
                                itemCount: schedules.length,
                                itemBuilder: (context, index) {
                                  return TimelineTile(
                                    lineXY: 0.15,
                                    alignment: TimelineAlign.manual,
                                    hasIndicator: false,
                                    axis: TimelineAxis.vertical,
                                    startChild: Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          Text(
                                            schedules[index].time,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Poppins',
                                            ),
                                          ),
                                          // Update this with actual time from schedule data
                                          Text(
                                            schedules[index].time,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xffBCC1CD), fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    endChild: ScheduleCard(
                                      subject: schedules[index].subject,
                                      chapter: schedules[index].description,
                                      chapterNo: schedules[index].room,
                                      roomNo: schedules[index].room,
                                      teacherPic: 'lib/assets/p1.png',
                                      teacherName: schedules[index].teacher,
                                      color1: const Color(0xff4DC591),
                                      isCornerWidget: false,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            ),
        );
    }
}