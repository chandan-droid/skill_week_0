import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.subject,
    required this.chapter,
    required this.chapterNo,
    required this.roomNo,
    required this.teacherPic,
    required this.teacherName,
    required this.color1,
     this.color2,

  });

  final String subject;
  final String chapter;
  final String chapterNo;
  final String roomNo;
  final String teacherPic;
  final String teacherName;
  final Color color1;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
      width: double.infinity,

      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Align(alignment:Alignment.topRight,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16)
                  ),
                  child: Image.asset('lib/assets/Vector2.png',color: color2,))
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "chapter $chapterNo : $chapter",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white,fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageIcon(AssetImage('lib/assets/icons/location.png',),color: Colors.white,),
                        Text('Room $roomNo',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'Poppins'),)
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(radius:8,backgroundImage: AssetImage(teacherPic),),
                        SizedBox(width: 5,),
                        Text(teacherName,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'Poppins'),)
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                    child: const ImageIcon(AssetImage('lib/assets/icons/option.png',),color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

