import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/controller/BirthdayPickerField.dart';
import 'package:flutter/material.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/checkbox_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                    SizedBox(height: 50.h),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset('assets/icons/arrow-left.png'),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Sign in to your Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffFFFFFF),
                        ),
                        children: [
                          const TextSpan(text: "Already have an account?"),
                          TextSpan(
                            text: ' Sign in',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2563EB),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed('/login_screen'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'First Name',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color(0xff4B5563),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            'Last Name',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: const Color(0xff4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'lois',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your First Name";
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'Becket',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your Last Name";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
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
                          return "Email is required";
                        }
                        //  Gmail-only validation
                        final gmailRegex =  RegExp(
                          r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                        );

                        if (!gmailRegex.hasMatch(value)) {
                          return "Enter a valid Email";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Phone',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                        hintText: '001234556789',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "mobile number is required";
                        }

                        //  Bangladeshi mobile number validation
                        final bangladeshPhoneRegex =  RegExp(
                          r'^(?:\+8801|01)[0-9]{9}$',
                        );

                      

                        if (!bangladeshPhoneRegex.hasMatch(value)) {
                          return "Enter a valid Bangladeshi phone number";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Address',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'los angeless',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your Address";
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Zip Code',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'Zip code',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your zip code';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    BirthdayPickerField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Birthday is required';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),

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
                      suffixIcon: InkWell(
                        child: Image.asset(
                          'assets/icons/eye-off.png',
                          height: 16.h,
                          width: 16.w,
                        ),
                        onTap: () {},
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
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
                      suffixIcon: InkWell(
                        child: Image.asset(
                          'assets/icons/eye-off.png',
                          height: 16.h,
                          width: 16.w,
                        ),
                        onTap: () {},
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      text: 'Register',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Success",
                            "Account created successfully!",
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                          Get.toNamed('/emailvrification_screen');
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
