import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  const CustomText({
    super.key,
    required this.text,
    
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text??"",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: const Color(0xff030712),
      ),
    );
  }
}