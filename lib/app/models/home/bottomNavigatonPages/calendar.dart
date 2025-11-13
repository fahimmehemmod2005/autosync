import 'package:autosync/app/models/home/bottomNavigatonPages/home.dart';
import 'package:autosync/app/models/home/main_screen.dart';
import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/controller/BirthdayPickerField.dart';
import 'package:flutter/material.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../splash & Login Authentication/auth/controller/checkbox_controller.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Schedule Service',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xff030712),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  Text(
                    'Select Unit',
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
                    'What service do you need?',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0xff4B5563),
                      
                    ),
                  ),
                  CustomTextFormField(
                    maxLines: 3,
                    borderColor: Color(0xff9CA3AF),
                    hintText: 'Add any important details about the unit',
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
                      // SizedBox(height: 20),
                      // Text(
                      //   _selectedLocation == null
                      //       ? 'Please select a location'
                      //       : 'Selected location: $_selectedLocation',
                      // ),
                    ],
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
                  SizedBox(height: 30.h),
                  CustomButton(
                    text: 'Submit Unit',
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar(
                          "Success",
                          "Account created successfully!",
                          colorText: Colors.black,
                          backgroundColor: Colors.white,
                          snackPosition: SnackPosition.TOP,
                        );
                        Get.to(MainScreen());
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
            ],
          ),
        ),
      ), 
    );
  }
}