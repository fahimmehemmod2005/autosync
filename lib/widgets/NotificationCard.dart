import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ===== MODEL =====
class NotificationModel {
  final String title;
  final String time;
  final bool isRecent;

  NotificationModel({
    required this.title,
    required this.time,
    this.isRecent = false,
  });
}

// ===== CARD =====
class NotificationCard extends StatelessWidget {
  final NotificationModel notif;
  final int index; // 👈 index to detect first two

  const NotificationCard({super.key, required this.notif, required this.index});

  @override
  Widget build(BuildContext context) {
    // Sky blue for first two cards, white for the rest
    final bgColor = index < 2 ? const Color(0xffEAF1FF) : Colors.transparent;

    return Container(
      margin: const EdgeInsets.only(bottom: 10), // space between cards
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔔 Icon
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff6b7280),
              size: 26,
            ),
          ),
          const SizedBox(width: 12),

          // 🧾 Title & Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff111827),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Color(0xff9ca3af),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      notif.time,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xff9ca3af),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
