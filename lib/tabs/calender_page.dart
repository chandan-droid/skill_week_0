import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widgets/schedule_card.dart';

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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth*0.07,),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '24',
                        style: const TextStyle(
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
                          icon: ImageIcon(
                            AssetImage('lib/assets/icons/filter.png'),
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      TimelineTile(
                        lineXY: 0.15,
                        alignment: TimelineAlign.manual,
                        hasIndicator: false,
                        axis: TimelineAxis.vertical,
                        startChild: Container(
                          margin: EdgeInsets.all(5),
                          child: const Column(
                            children: [
                              Text(
                                '11:35',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
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
                        endChild: const ScheduleCard(
                          subject: 'Mathematics',
                          chapter: 'Introduction',
                          chapterNo: '1',
                          roomNo: '6-205' '',
                          teacherPic: 'lib/assets/p1.png',
                          teacherName: 'Brooklyn Williamson',
                          color1: Color(0xff4DC591),
                          isCornerWidget: false,
                        ),
                      ),
                      TimelineTile(
                        lineXY: 0.15,
                        alignment: TimelineAlign.manual,
                        hasIndicator: false,
                        axis: TimelineAxis.vertical,
                        startChild: Container(
                          margin: EdgeInsets.all(5),
                          child: const Column(
                            children: [
                              Text(
                                '13:15',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
                                '14:45',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBCC1CD),
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                        endChild: const ScheduleCard(
                          subject: 'Biology',
                          chapter: 'Animal Kingdom',
                          chapterNo: '3',
                          roomNo: '2-168' '',
                          teacherPic: 'lib/assets/p2.png',
                          teacherName: 'Julie Watson',
                          isCornerWidget: false,
                        ),
                      ),
                      TimelineTile(
                        lineXY: 0.15,
                        alignment: TimelineAlign.manual,
                        hasIndicator: false,
                        axis: TimelineAxis.vertical,
                        startChild: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                '15:10',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
                                '18:40',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBCC1CD),
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                        endChild: ScheduleCard(
                          subject: 'Geography',
                          chapter: 'Economy USA',
                          chapterNo: '2',
                          roomNo: '1-403' '',
                          teacherPic: 'lib/assets/p3.png',
                          teacherName: 'Jenny Alexander',
                          isCornerWidget: false,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
