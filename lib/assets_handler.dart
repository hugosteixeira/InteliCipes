import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assets{
  static final AssetImage IntelicipesLogo01 = AssetImage("extra/Images/bitmap 01.png");
  static final AssetImage IntelicipesLogo02 = AssetImage("extra/Images/bitmap 02.png");
  static final AssetImage IntelicipesLogo03 = AssetImage("extra/Images/bitmap 03.png");
  static final AssetImage Placeholder1 = AssetImage("extra/Images/placeholder comida.png");
  static final AssetImage Placeholder2 = AssetImage("extra/Images/placeholder comida 02.png");
  static final AssetImage Placeholder3 = AssetImage("extra/Images/placeholder comida 03.png");
  static final AssetImage Placeholder4 = AssetImage("extra/Images/placeholder comida 04.png");
  static final AssetImage Display01 = AssetImage("extra/Images/receita 01.png");
  static final SizedBox SmallPaddingBox = SizedBox(height: 10,width: 10);
  static final Color redColor = Color(0xfff8333c);
  static final Color blackColor = Color(0xff2d3142);
  static final Color yellowColor = Color(0xfffcab10);
  static final Color whiteColor = Color(0xffFDFFFC);
  static final TextStyle InriaSans45 = GoogleFonts.inriaSans(
      fontSize: 45,
      fontStyle: FontStyle.italic);
  static final TextStyle InriaSans35 = GoogleFonts.inriaSans(
      fontSize: 35,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w100);
  static final TextStyle InriaSans25 = GoogleFonts.inriaSans(
      fontSize: 25,
  );
  static final TextStyle InriaSans18 = GoogleFonts.inriaSans(
      fontSize: 18,
      fontStyle: FontStyle.italic);
  static final TextStyle InriaSans18dim = GoogleFonts.inriaSans(
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: Colors.grey
  );
}
