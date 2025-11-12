import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/checkbox_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    SizedBox(height: 80.h),
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
                          const TextSpan(
                            text: "Don't have an account? ",
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2563EB),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed('/signup_screen'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
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
                    SizedBox(height: 15.h),
                    Text(
                      'Password',
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
                    SizedBox(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              Checkbox(
                                value: controller.isChecked.value,
                                onChanged: controller.toggleCheckbox,
                                activeColor: const Color(0xff2563EB),
                                checkColor: Colors.white,
                              ),
                              Text(
                                "Remember me",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: const Color(0xff6C7278),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed('/forgot_screen'),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: const Color(0xff2563EB),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(text: 'Login',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Success",
                            "Login successfully!",
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                          Get.toNamed('/main_screen');
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
                    SizedBox(height: 150.h),
                Center(
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6B7280),
                          ),
                          children: [
                            const TextSpan(
                              text: "By signing up, you agree to the",
                            ),
                            TextSpan(
                              text: '  Terms of Service',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff111827),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6B7280),
                          ),
                          children: [
                            const TextSpan(
                              text: "and",
                            ),
                            TextSpan(
                              text: ' Data Processing Agreement',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff111827),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 55.h),
                    ],
                  ),
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
