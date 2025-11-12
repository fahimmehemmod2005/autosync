import 'package:autosync/app/models/splash%20&%20Login%20Authentication/auth/controller/BirthdayPickerField.dart';
import 'package:flutter/material.dart';
import 'package:autosync/widgets/custom_button.dart';
import 'package:autosync/widgets/custom_textformfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../splash & Login Authentication/auth/controller/checkbox_controller.dart';

class AddunitScreen extends StatefulWidget {
  const AddunitScreen({super.key});

  @override
  State<AddunitScreen> createState() => _AddunitScreenState();
}

class _AddunitScreenState extends State<AddunitScreen> {
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
        title: Text(
          'Add Unit',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xff030712),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // VIN
                    Text(
                      'VIN',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: const Color(0xff9CA3AF),
                      hintText: 'Enter VIN',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your VIN';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),

                    // Brand
                    Text(
                      'Brand',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: const Color(0xff9CA3AF),
                      hintText: 'Enter Brand',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Brand';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),

                    // Model
                    Text(
                      'Model',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: const Color(0xff9CA3AF),
                      hintText: 'Enter Model',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Model';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),

                    // Year
                    Text(
                      'Year',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    CustomTextFormField(
                      borderColor: const Color(0xff9CA3AF),
                      hintText: 'Enter Year',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Year';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),

                    // Date of Purchase
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
                          return 'Date of purchase is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),

                    // Location Dropdown
                    Text(
                      'Share/Location',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
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
                            color: Color(0xff8F959E),
                            width: 1.5,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Color(0xffD1D1D6),
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
                          color: const Color(0xff9CA3AF),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // Upload Image (Optional)
                    Text(
                      'Upload Image (Optional)',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: const Color(0xff4B5563),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Register Button
                    CustomButton(
                      text: 'Confirm',
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.snackbar(
                            "Success",
                            "Unit registered successfully!",
                            colorText: Colors.black,
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                          Get.toNamed('/mygarageScreen');
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
                    SizedBox(height: 55.h),
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
