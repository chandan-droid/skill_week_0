import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  final String subject;
  final AssetImage icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 149,
      height: 119,
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
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(icon,color: Colors.white,),
                    ImageIcon(AssetImage('lib/assets/icons/option.png',),color: Colors.white,)
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  subject,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}