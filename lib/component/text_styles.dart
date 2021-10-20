import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{

  TextStyle percentCal_plainTextStyle(){
    return GoogleFonts.archivo(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }

  TextStyle percentCal_titleTextStyle(){
    return GoogleFonts.archivo(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}