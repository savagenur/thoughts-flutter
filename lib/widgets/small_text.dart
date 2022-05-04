import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  String text;
  double? size;
  Color? color;

   SmallText({Key? key
   ,
   required this.text,
   this.size=20,
   this.color= Colors.white
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
          
          // fontFamily: "Honey Notes",
          fontSize: size,
          color: color
        )
        ),
      ),
    );
  }
}