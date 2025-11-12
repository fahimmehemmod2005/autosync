import 'package:autosync/app/models/home/bottomNavigatonPages/custom_ink.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/custom_text.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        leading: const SizedBox(),
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
          const Spacer(),
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

            // 🔹 Top banner images
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

            /// ------------------- Custom Card Section ------------------- ///
            SizedBox(
              height: 258.h,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xffE5E7EB),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    // 🔹 Inner card with logo
                    SizedBox(
                      height: 84.h,
                      width: 310.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xffD1D5DB),
                        child: Center(
                          child: Image.asset(
                            'assets/images/bmw.png',
                            height: 44.h,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // 🔹 Icon row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/call.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/chat.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/loc.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/team.svg'),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // 🔹 Text row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CustomText(text: 'Call'),
                        CustomText(text: 'Chat'),
                        CustomText(text: 'Location'),
                        CustomText(text: 'Team'),
                      ],
                    ),

                    SizedBox(height: 15.h),

                    // 🔹 Review button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomButton(
                        text: 'Leave a Review',
                        onpress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 258.h,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xffE5E7EB),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    // 🔹 Inner card with logo
                    SizedBox(
                      height: 84.h,
                      width: 310.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: const Color(0xffD1D5DB),
                        child: Center(
                          child: Image.asset(
                            'assets/images/triu.png',
                            height: 44.h,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // 🔹 Icon row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/call.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/chat.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/loc.svg'),
                        ),
                        CustomInk(
                          ontap: () {},
                          child: SvgPicture.asset('assets/icons/team.svg'),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    // 🔹 Text row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CustomText(text: 'Call'),
                        CustomText(text: 'Chat'),
                        CustomText(text: 'Location'),
                        CustomText(text: 'Team'),
                      ],
                    ),

                    SizedBox(height: 15.h),

                    // 🔹 Review button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomButton(
                        text: 'Leave a Review',
                        onpress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
