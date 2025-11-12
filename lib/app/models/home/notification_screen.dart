import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Notification',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xff030712),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context,index) => SizedBox(height: 10.h,),
        itemBuilder: (context,index) => Column(
          children: [
            ListTile(
              leading:  CircleAvatar(
                backgroundColor:Color(0xffF3F4F6),
                radius: 30,
                child: Image(image: AssetImage('assets/icons/noti1.png'),height: 24,width: 24,),
              ),
              title: Text('Reminder: Your service is tomorrow at 10:00 AM',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff030712),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:90 ),
              child: Row(
                children: [
                  Icon(Icons.access_time_rounded,color: Color(0xff6B7280),),
                  SizedBox(width: 5,),
                  Text('1 hour ago',style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff6B7280),
              ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
