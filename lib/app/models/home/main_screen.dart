import 'package:autosync/app/models/home/bottomNavigatonPages/calendar.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/email.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/home.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/sell.dart';
import 'package:autosync/app/models/home/bottomNavigatonPages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> screens = <Widget>[
    const HomeScreen(),
    const CalendarScreen(),
    const SellScreen(),
    const EmailScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 100.h,
        child: BottomNavigationBar(
          selectedFontSize: 12.sp,
          fixedColor: Color(0xffFFFFFF),
          backgroundColor: Color(0xff030712),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xff6B7280)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Color(0xff6B7280)),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sell, color: Color(0xff6B7280)),
              label: 'Sell',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email, color: Color(0xff6B7280)),
              label: 'Email',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xff6B7280)),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
