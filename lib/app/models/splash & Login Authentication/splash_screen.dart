import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    jumpToNextPage();
    super.initState();
  }

  jumpToNextPage() {
    Future.delayed(
      Duration(seconds: 3),
      () => Get.offAllNamed('/login_screen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0D1B),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/icons/splash.png',
              height: 85.h,
              width: 259.w,
            ),
          ),
          Image.asset(
            'assets/icons/white.png',
          ),
        ],
      ),
    );
  }
}
