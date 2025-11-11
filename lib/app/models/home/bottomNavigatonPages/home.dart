import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w), 
        child: ListView(
          children: [
            SizedBox(height: 14.h), 
            Row(
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  height: 36.h,
                ),
                SizedBox(width: 5.w),
                Text('Hi, Jenny',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: const Color(0xff4B5563)
                ),),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/frame1.png', 
                  ),
                ),  
              ],
            ),
          ],
        ),
      ),
    );
  }
}
