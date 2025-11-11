import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'otp screen/pinput_controller.dart';

class ResetpassScreen extends StatefulWidget {
  const ResetpassScreen({super.key});

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {

   final PinController pinController = Get.put(PinController());
  final _formKey = GlobalKey<FormState>();
  final RxBool showError = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Image.asset(
                'assets/icons/image.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset('assets/icons/arrow-left.png'),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'Reset Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 140.h),
                    Text(
                      'New Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      obscureText: true,
                        hintText: '*********',
                      suffixIcon: InkWell(child: Image.asset('assets/icons/eye-off.png',height: 16.h,width: 16.w),onTap: (){},),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },),
                      SizedBox(height: 20.h,),
                      Text(
                      'Confirm Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                      CustomTextFormField(
                        obscureText: true,
                        hintText: '*********',
                      suffixIcon: InkWell(child: Image.asset('assets/icons/eye-off.png',height: 16.h,width: 16.w),onTap: (){},),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },),
                      SizedBox(height: 25.h,),
                      CustomButton(text: 'Reset Password',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Success",
                            "Password reset successfully!",
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                          Get.toNamed('/login_screen');
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please correct all fields",
                            backgroundColor: Colors.white,
                            colorText: Colors.black,
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
