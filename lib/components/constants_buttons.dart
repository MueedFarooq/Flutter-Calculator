import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
final  String title;
final  Color color;
final VoidCallback onpress;
 const Mybutton({super.key, required this.title,  this.color = const Color(0xff505050 ),required this.onpress});
// #4A4A4A
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onpress,
          child: Container(
            height: 78,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle

            ),
            child: Center(child: Text(title,style: TextStyle(fontSize: 23,color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}
