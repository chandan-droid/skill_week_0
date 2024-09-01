import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/schedule_card.dart';
import '../widgets/subject_card.dart';
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context ).size.width;
    //print(screenWidth);
    double screenHeight = MediaQuery.of(context).size.height;
    //print(screenHeight);
   return SafeArea(
     child: Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverAppBar(
             backgroundColor: Color(0xff00664F),
             floating: true,
             pinned: true,
             centerTitle: false,
             expandedHeight: screenHeight*0.5,
             flexibleSpace:  const FlexibleSpaceBar(
               background: Stack(
                 clipBehavior: Clip.hardEdge,
                 children:[
                   Positioned(
                     bottom:32,
                     right: 0,
                     child: Image(
                       image: AssetImage("lib/assets/Vector.png"),

                     ),
                   ),
                   Positioned(
                     right: 0,
                     bottom: 32,
                     child: Image(
                       image: AssetImage("lib/assets/image.png"),
                     ),
                   ),
                 ]
               ),
               stretchModes: [
                 StretchMode.blurBackground,
                 StretchMode.zoomBackground,
               ],
             ),
             leadingWidth: 80.0,
             leading:Container(
               margin: const EdgeInsets.only(left: 24.0),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(15.0),
                 child: BackdropFilter(
                   filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                   child: Container(
                     height: 56.0,
                     width: 56.0,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       color: Colors.white.withOpacity(0.20),
                     ),
                     child:Icon(Icons.search,size: 35,color: Colors.white54,),
                   ),
                 ),
               ),
             ),
             bottom: PreferredSize(
               preferredSize: const Size.fromHeight(0.0),
               child: Container(
                 height: 32.0,
                 alignment: Alignment.center,
                 decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(32.0),
                     topRight: Radius.circular(32.0),
                   ),
                 ),
               ),
             ),
           ),
            SliverToBoxAdapter(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   margin:const EdgeInsets.only(left: 28),
                   child: const Text(
                     'Subjects',
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.w700,
                       fontFamily: 'Poppins'
                     ),
                   ),
                 ),
                 const SizedBox(height: 8.0),
                 Container(
                   margin:const EdgeInsets.only(left: 28),
                   child: const Text(
                     'Recommendation for you',
                     style: TextStyle(
                       color: Color(0xffBCC1CD),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: 'Poppins'
                     ),
                   ),
                 ),
                 SizedBox(height: 8.0),
                 const SizedBox(
                   child: SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         SubjectCard(subject:'Mathematics' ,
                             icon: AssetImage('lib/assets/icons/math.png'),
                             color1: Color(0xffFF7648),
                           color2: Color(0xffFFC278),),
                         SubjectCard(subject:'Geography' ,
                             icon: AssetImage('lib/assets/icons/geo.png'),
                             color1:Color(0xff8F98FF),
                           color2: Color(0xff182A88),),
                         SubjectCard(subject:'Biology' ,
                             icon: AssetImage('lib/assets/icons/math.png'),
                             color1:Color(0xff4DC591),
                           color2: Color(0xff00664F),),
                         SubjectCard(subject:'History' ,
                             icon: AssetImage('lib/assets/icons/math.png'),
                             color1:Color(0xff00664F),
                           color2: Color(0xffFF7648),),
                       ],
                     ),
                   ),
                 ),
                 const SizedBox(height: 8.0),
                 Container(
                   margin:EdgeInsets.only(left: 28),
                   child: const Text(
                     'Your Schedules',
                     style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.w700,
                         fontFamily: 'Poppins'
                     ),
                   ),
                 ),
                 SizedBox(height: 8.0),
                 Container(
                   margin:const EdgeInsets.only(left: 28),
                   child: const Text(
                     'Next lessons',
                     style: TextStyle(
                         color: Color(0xffBCC1CD),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: 'Poppins'
                     ),
                   ),
                 ),
                 const SizedBox(height: 8.0),
                 const Column(
                   children: [
                     ScheduleCard(subject: 'Biology',
                       chapter: 'Reproduction',
                       chapterNo: '3',
                       color1:Color(0xff4DC591),
                       color2: Color(0xff00664F),
                       roomNo: '6-205''',
                       teacherPic: 'lib/assets/p1.png',
                       teacherName: 'Brooklyn Williamson',
                       isCornerWidget: true,

                     ),
                     
                   ],
                 )
     
               ],
             ),
           )
         ],
       ),
     ),
   );
  }
}





