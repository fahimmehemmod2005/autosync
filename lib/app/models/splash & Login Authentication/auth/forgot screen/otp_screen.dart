import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../../widgets/custom_button.dart';
import 'otp screen/pinput_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final PinController pinController = Get.put(PinController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Image.asset('assets/icons/image.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    InkWell(onTap: () => Get.back(),child: Image.asset('assets/icons/arrow-left.png'),),
                    SizedBox(height: 25.h),
                    Text(
                      'Verify Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 140.h),
                    Obx(() {
                      return Center(
                        child: Pinput(
                          length: 6,
                          onChanged: pinController.updatePin, // ✅ fixed name
                          defaultPinTheme: PinTheme(
                            width: 44.w,
                            height: 55.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: pinController.isPinLengthValid()
                                    ? const Color(0xff2563EB)
                                    : Colors.grey,
                                width: 1.2,
                              ),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 44.w,
                            height: 55.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xff2563EB),
                                width: 2,
                              ),
                            ),
                          ),
                          submittedPinTheme: PinTheme(
                            width: 44.w,
                            height: 55.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 32.h,),
                    CustomButton(text: 'Send Otp',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/resetpass_screen');
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please correct all fields",
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
