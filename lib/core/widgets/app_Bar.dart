import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar({
  required String title,
  required double screenWidth,
  Color backgroundColor = const Color(0xff93714A),
}) {
  return AppBar(
    leading: SizedBox(),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(45),
        bottomRight: Radius.circular(45),
      ),
    ),
    backgroundColor: backgroundColor,
    title: Text(
      title,
      style: GoogleFonts.alexandria(
        color: Colors.white,
        fontSize: screenWidth * 0.07,
        fontWeight: FontWeight.w500,
      ),
    ),
    centerTitle: true,
  );
}
