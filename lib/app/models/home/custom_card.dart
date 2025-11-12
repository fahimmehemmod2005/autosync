import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'bottomNavigatonPages/custom_ink.dart';
import 'bottomNavigatonPages/custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 258.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffE5E7EB),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Container(
            height: 84.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffD1D5DB),
            ),
            child: Center(
              child: Image.asset('assets/images/bmw.png', height: 44.h),
            ),
          ),
          SizedBox(height: 15.h),
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
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(text: 'Call'),
              CustomText(text: 'Chat'),
              CustomText(text: 'Location'),
              CustomText(text: 'Team'),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: 'Leave a Review', onpress: () {}),
          ),
        ],
      ),
    );
  }
}
