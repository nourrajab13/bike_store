import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {

static Widget firstText(String text, Color color, double fontSize){
    return Text(text,
    textAlign: TextAlign.justify,
    style: GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600
    ));
  }
 
  static Widget primaryText(String text, Color color, double fontSize){
    return Text(text,style: GoogleFonts.bigshotOne(
      fontSize: fontSize,
      color: color,
    ));
  }
  static Widget spicyRice(String text, Color color, double fontSize){
    return Text(text,style: GoogleFonts.spicyRice(
      fontSize: fontSize,
      color: color,
    ));
  }
  static Widget pacifico(String text, Color color, double fontSize){
    return Text(text,style: GoogleFonts.pacifico(
      fontSize: fontSize,
      color: color,
    ));
  }
  
}