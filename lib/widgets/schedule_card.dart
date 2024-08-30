import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
     this.color1,
     this.color2,
    required this.isCornerWidget,

  });

  final String subject;
  final String chapter;
  final String chapterNo;
  final String roomNo;
  final String teacherPic;
  final String teacherName;
  final Color? color1;
  final Color? color2;
  final bool isCornerWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:16,vertical: 10),
      width: double.infinity,

      decoration: BoxDecoration(
        color: (color1!=null)?color1:const Color(0xffF6F6F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          isCornerWidget? Align(
            alignment: Alignment.topRight,
            child:ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16)
              ),
              child: Image.asset('lib/assets/Vector2.png',color: color2,)),):Container(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        subject,
                        style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: (color1!=null)?Colors.white:Colors.black,fontFamily: 'Poppins'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    FittedBox(
                      child:Text(
                      "chapter $chapterNo : $chapter",
                      style:  TextStyle(overflow:TextOverflow.fade,fontSize: 12, fontWeight: FontWeight.w500,color:(color1!=null)?Colors.white:Colors.black,fontFamily: 'Poppins'),
                    ),),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         ImageIcon(AssetImage('lib/assets/icons/location.png',),color: (color1!=null)?Colors.white:Colors.black),
                        FittedBox(

                          child: Text('Room $roomNo',
                              style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color:(color1!=null)?Colors.white:Colors.black,fontFamily: 'Poppins'),),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(radius:8,backgroundImage: AssetImage(teacherPic),),
                        SizedBox(width: 5,),
                        buildText(context,teacherName,0.016,color1)
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                    child:  ImageIcon(const AssetImage('lib/assets/icons/option.png',),color: (color1!=null)?Colors.white:Colors.black))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget buildText(BuildContext context,teacherName,ratio,color) => FittedBox(
  child: Text(teacherName,
    style:  TextStyle(fontSize:12, fontWeight: FontWeight.w400,color:(color!=null)?Colors.white:Colors.black,fontFamily: 'Poppins'),),
);




