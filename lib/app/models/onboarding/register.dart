import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/controller/BirthdayPickerField.dart';
import 'package:flutter/material.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../splash & Login Authentication/auth/controller/checkbox_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final CheckboxController controller = Get.put(CheckboxController());
  final _formKey = GlobalKey<FormState>();

  String? _selectedLocation;

  final List<String> locations = [
    'Dhaka',
    'Chittagong',
    'Khulna',
    'Sylhet',
    'Rajshahi',
    'Barisal',
    'Rangpur',
    'Mymensingh',
  ];

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
                      'Register Your Unit',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(height: 150.h),
                    Text(
                      'VIN',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: Color(0xff9CA3AF),
                      hintText: 'Enter VIN',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your zip code';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Brand',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: Color(0xff9CA3AF),
                      hintText: 'Enter Brand',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your zip code';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Model',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: Color(0xff9CA3AF),
                      hintText: 'Enter Model',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your Address";
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Year',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: Color(0xff9CA3AF),
                      hintText: 'Enter Year',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your zip code';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Date of Purchase',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    BirthdayPickerField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Birthday is required';
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Share/Location',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color(
                                  0xff8F959E,
                                ), 
                                width: 1.5,
                              ),
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Color(0xffD1D1D6), // light grey color
                                width: 1.0,
                              ),
                            ),
                          ),
                          items: locations.map((location) {
                            return DropdownMenuItem<String>(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                          hint: Text(
                            'Select location',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Color(0xff9CA3AF),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Text(
                        //   _selectedLocation == null
                        //       ? 'Please select a location'
                        //       : 'Selected location: $_selectedLocation',
                        // ),
                      ],
                    ),
                    Text(
                      'Additional Notes (Optional)',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                        
                      ),
                    ),
                    CustomTextFormField(
                      maxLines: 4,
                      borderColor: Color(0xff9CA3AF),
                      hintText: 'Add any important details about the unit',
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Upload Image (Optional)',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      text: 'Register Unit',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Success",
                            "Account created successfully!",
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
                    SizedBox(height: 55),
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
