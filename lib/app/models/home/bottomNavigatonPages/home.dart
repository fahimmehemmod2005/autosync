import 'package:autosync/app/models/home/bottomNavigatonPages/custom_ink.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/custom_text.dart';
import 'package:autosync/app/models/home/custom_card.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        leading: SizedBox(),
        elevation: 0,
        actions: [
          SizedBox(width: 16.w),
          InkWell(
            onTap: () {},
            child: Image.asset('assets/images/profile.png', height: 36.h),
          ),
          SizedBox(width: 5.w),
          Text(
            'Hi, Jenny',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              color: const Color(0xff4B5563),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () => Get.toNamed('/notification_screen'),
            child: Image.asset('assets/icons/frame1.png'),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SizedBox(height: 22.h),
            InkWell(onTap: () {}, child: Image.asset('assets/images/ai.png')),
            SizedBox(height: 16.h),
            InkWell(onTap: () {}, child: Image.asset('assets/images/my.png')),
            SizedBox(height: 20.h),
            Text(
              'Our Dealerships',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff000000),
              ),
            ),
            SizedBox(height: 12.h),
            Card(
              child: ListView.separated(
              separatorBuilder: (_, index) => SizedBox(height: 10.h,),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) => CustomCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}