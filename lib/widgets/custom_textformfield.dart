import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final void Function(String)? onChanged;
  final Color? borderColor;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.borderColor,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines, 
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: const Color(0xff8F959E),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: borderColor ?? Color(0xff8F959E),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        prefix: prefix,

        // ✅ Added grey border styles below
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Color(0xffD1D1D6), // light grey color
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xff8F959E), // darker grey when focused
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
