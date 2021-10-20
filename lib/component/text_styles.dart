import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{

  TextStyle percentCal_plainTextStyle(){
    return GoogleFonts.lato(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }

  TextStyle percentCal_titleTextStyle(){
    return GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}