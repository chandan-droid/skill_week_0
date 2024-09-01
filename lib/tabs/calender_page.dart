import 'dart:convert';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_week_0/model.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widgets/schedule_card.dart';
import 'package:http/http.dart' as http;

class CalenderPage extends StatefulWidget {
  const CalenderPage({
    super.key,
    required this.date,
  });
  final String date;

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  List<Schedule> schedules=[];
  Future getSchedule() async{
    var response = await http.get(Uri.https('scheduleapi-7rkx.onrender.com','/API/get'));
    var jsonData = jsonDecode(response.body);

    for(var data in jsonData){
      final schedule = Schedule(
          time: data['time'],
          subject: data['subject'],
          description: data['description'],
          room: data['room'],
          teacher: data['teacher'],
          date: data['room']
      );
      schedules.add(schedule);
    }
  }

  @override
  Widget build(BuildContext context) {
    getSchedule();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth*0.07,),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '24',
                        style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wed',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffBCC1CD),
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            'Jan 2020',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffBCC1CD),
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          color: Color(0xff4DC591).withOpacity(0.1),
                          child: Text(
                            'Today',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4DC591),
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: EasyDateTimeLine(
                  initialDate: DateTime.now().subtract(Duration(days: 3)),
                  activeColor: Color(0xffFF7648),
                  dayProps: EasyDayProps(
                      height: 62,
                      width: 40,
                      dayStructure: DayStructure.dayStrDayNum,
                      activeDayStyle: DayStyle(
                          dayNumStyle: TextStyle(color: Colors.white),
                          dayStrStyle: TextStyle(color: Colors.white))),
                  headerProps: EasyHeaderProps(
                    showHeader: false,
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(right: screenWidth*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth*0.05,
                      ),
                      const Text(
                        'Time',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffBCC1CD),
                            fontFamily: 'Poppins'),
                      ),
                       SizedBox(
                        width: screenWidth*0.1,
                      ),
                      const Text(
                        'Course',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffBCC1CD),
                            fontFamily: 'Poppins'),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage('lib/assets/icons/filter.png'),
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
                FutureBuilder(
                  future: getSchedule(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: schedules.length,
                          itemBuilder:(context,index){
                            return TimelineTile(
                              lineXY: 0.15,
                              alignment: TimelineAlign.manual,
                              hasIndicator: false,
                              axis: TimelineAxis.vertical,
                              startChild: Container(
                                margin: const EdgeInsets.all(5),
                                child:  Column(
                                  children: [
                                    Text(
                                      schedules[index].time,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Poppins'),
                                    ),
                                    const Text(
                                      '11:35',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffBCC1CD),
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ),
                              endChild:  ScheduleCard(
                                subject: schedules[index].subject,
                                chapter: schedules[index].description,
                                chapterNo: schedules[index].room,
                                roomNo: schedules[index].room,
                                teacherPic: 'lib/assets/p1.png',
                                teacherName: schedules[index].teacher,
                                color1: Color(0xff4DC591),
                                isCornerWidget: false,
                              ),
                            );

                          }
                      );
                    }else{
                      return const Center(
                        child:CircularProgressIndicator() ,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
