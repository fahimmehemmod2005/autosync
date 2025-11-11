import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  // reactive flag for showing validation message
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
                      'Verify Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 140.h),

                    /// --- Pinput field ---
                    Obx(() {
                      return Center(
                        child: Pinput(
                          length: 6,
                          onChanged: (value) {
                            pinController.updatePin(value);

                            // hide error message if input becomes valid
                            if (pinController.isPinLengthValid()) {
                              showError.value = false;
                            }
                          },
                          defaultPinTheme: PinTheme(
                            width: 44.w,
                            height: 50.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
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
                            height: 50.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                            height: 50.h,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: Colors.grey, width: 2.w),
                            ),
                          ),
                        ),
                      );
                    }),

                    /// --- Error Message under Pinput ---
                    Obx(() {
                      return Visibility(
                        visible: showError.value,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            "Please enter a valid OTP",
                            style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),

                    SizedBox(height: 32.h),

                    /// --- Send OTP Button ---
                    CustomButton(
                      text: 'Send OTP',
                      onpress: () {
                        if (!pinController.isPinLengthValid()) {
                          showError.value = true;
                          return;
                        } else if (_formKey.currentState!.validate()) {
                          Get.toNamed('/resetpass_screen');
                          Get.snackbar(
                            "Success",
                            "Login successfully!",
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
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
