import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/custom_button.dart';
import '../controller/checkbox_controller.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final CheckboxController controller = Get.put(CheckboxController());
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
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 140.h),
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'name@gmail.com',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email or mobile number is required";
                        }

                        //  Bangladeshi mobile number validation
                        final bangladeshPhoneRegex =  RegExp(
                          r'^(?:\+8801|01)[0-9]{9}$',
                        );

                        //  Gmail-only validation
                        final gmailRegex =  RegExp(
                          r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                        );

                        if (!bangladeshPhoneRegex.hasMatch(value) &&
                            !gmailRegex.hasMatch(value)) {
                          return "Enter a valid Bangladeshi phone number or Gmail address";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(height: 30.h),
                    CustomButton(text: 'Send Otp',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/otp_screen');
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please correct all fields",
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
