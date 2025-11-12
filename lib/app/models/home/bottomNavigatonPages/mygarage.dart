
import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGarageScreen extends StatefulWidget {
  const MyGarageScreen({super.key});

  @override
  State<MyGarageScreen> createState() => _MyGarageScreenState();
}

class _MyGarageScreenState extends State<MyGarageScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Garage',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff030712),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) => SizedBox(
            height: 351.5.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Color(0xffE5E7EB),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 144.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/bike1.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Make: BMW',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff030712)
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Model: G0310R',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                         color: Color(0xff030712)
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Year: 2025',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                         color: Color(0xff030712)
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'VIN: 1HGBH41JXMN109186',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                         color: Color(0xff030712)
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Date of Purchase: 11 January 2025',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                         color: Color(0xff030712)
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Text(
                      'Store of Purchase: BMG Xtreme Sports',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                         color: Color(0xff030712)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(text: '+Add Unit',onpress: () => Get.toNamed('/addunitScreen'),),
      ),
    );
  }
}
