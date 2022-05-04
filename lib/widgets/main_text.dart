import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  bool isShadow;

  MainText(
      {Key? key, required this.text, this.size = 28, this.color = Colors.white, this.isShadow=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.concertOne(
            textStyle: TextStyle(
                shadows: isShadow
                    ? [Shadow(color: Colors.black, offset: Offset(1, 1))]
                    : [],

                // fontFamily: "Honey Notes",
                fontSize: size,
                color: color)),
      ),
    );
  }
}
