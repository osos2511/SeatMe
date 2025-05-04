import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;

  const SharedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    this.borderRadius = 6,
    this.backgroundColor = const Color(0xff93714A),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.alexandria(
              color: Colors.white,
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
