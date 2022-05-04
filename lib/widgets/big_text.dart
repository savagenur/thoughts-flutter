import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  bool isShadow;

  BigText(
      {Key? key, required this.text, this.size = 26, this.color = Colors.white, this.isShadow=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.acme(
            textStyle: TextStyle(
                shadows:isShadow ? [Shadow(color: Colors.black, offset: Offset(1, 2))]:[],

                // fontFamily: "Honey Notes",
                fontSize: size,
                color: color)),
      ),
    );
  }
}
