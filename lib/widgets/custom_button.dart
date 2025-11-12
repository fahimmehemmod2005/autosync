import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onpress;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;

  const CustomButton({
    Key? key,
    required this.text,
    this.onpress,
    this.color = const Color(0xff030712),
    this.borderRadius = 8,
    this.height = 48 ,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          elevation: 0,
        ),
        onPressed: onpress,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color(0xffFEFEFE),
          ),
        ),
      ),
    );
  }
}