import 'dart:async';
import 'dart:math';

import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Random _random = Random();

  // Demo messages
  List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hi! How can I help you today?',
      'isMe': false,
      'time': '10:30 AM',
    },
    {
      'text': 'I need to schedule a service for my BMW.',
      'isMe': true,
      'time': '10:32 AM',
    },
    {
      'text': 'Sure! We have slots available tomorrow at 9 AM and 2 PM.',
      'isMe': false,
      'time': '10:33 AM',
    },
  ];

  bool _isTyping = false;
  Timer? _typingTimer;
  Timer? _replyTimer;

  // Realistic auto-reply pool
  final List<String> _botReplies = [
    "Great! Let me check availability...",
    "We can do an oil change and inspection for \$89.",
    "Would you like to book the 9 AM slot?",
    "Yes, we service all BMW models.",
    "You can drop off anytime after 8 AM.",
    "Payment can be made via card or cash.",
    "We offer a free courtesy car during service.",
    "Your VIN is required for accurate parts lookup.",
    "Would you like to add a tire rotation for \$40?",
    "Service usually takes 2–3 hours.",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _typingTimer?.cancel();
    _replyTimer?.cancel();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || _isTyping) return;

    setState(() {
      _messages.add({
        'text': text,
        'isMe': true,
        'time': _formatTime(DateTime.now()),
      });
      _isTyping = true;
    });

    _controller.clear();
    _scrollToBottom();

    // Simulate shop typing + reply
    _startBotReply();
  }

  void _startBotReply() {
    // Show typing indicator after 1 second
    _typingTimer = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _messages.add({
          'text': null, // null = typing
          'isMe': false,
          'time': null,
        });
      });
      _scrollToBottom();
    });

    // Send reply after 2–4 seconds
    final delay = 2000 + _random.nextInt(2000); // 2–4 sec
    _replyTimer = Timer(Duration(milliseconds: delay), () {
      setState(() {
        // Remove typing bubble
        _messages.removeWhere((m) => m['text'] == null);
        // Add real reply
        final reply = _botReplies[_random.nextInt(_botReplies.length)];
        _messages.add({
          'text': reply,
          'isMe': false,
          'time': _formatTime(DateTime.now()),
        });
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatTime(DateTime time) {
    final h = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final m = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0,
        actions: [
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          SizedBox(width: 12.w),
          ClipOval(
            child: Image.asset(
              'assets/images/profile1.png',
              height: 36.h,
              width: 36.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'Jimenez Motorsports',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xff030712),
            ),
          ),
          const Spacer(),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'] as bool;
                final text = msg['text'] as String?;
                final time = msg['time'] as String?;

                // Typing Indicator
                if (text == null) {
                  return _buildTypingBubble();
                }

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 0.75.sw),
                    margin: EdgeInsets.only(
                      top: 8.h,
                      bottom: 4.h,
                      left: isMe ? 40.w : 0,
                      right: isMe ? 0 : 40.w,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isMe
                          ? const Color(0xff3B82F6)
                          : const Color(0xffE5E7EB),
                      borderRadius: BorderRadius.circular(16.r).copyWith(
                        topLeft: isMe
                            ? Radius.circular(16.r)
                            : Radius.circular(4.r),
                        topRight: isMe
                            ? Radius.circular(4.r)
                            : Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: isMe
                                ? Colors.white
                                : const Color(0xff030712),
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          time!,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: isMe ? Colors.white70 : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Divider
          const Divider(height: 1, color: Colors.grey),

          // Input + Send
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: TextFormField(
              controller: _controller,
              enabled: !_isTyping, // Disable while bot is replying
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: _isTyping ? 'Shop is typing...' : 'Ask Anything...',
                hintStyle: TextStyle(
                  color: _isTyping ? Colors.grey[400] : Colors.grey,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                suffixIcon: SizedBox(
                  width: 85.w,
                  height: 35.h,
                  child: CustomButton(
                    text: 'Send',
                    onpress: _isTyping ? null : _sendMessage, // Disable button
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Typing Indicator Widget
  Widget _buildTypingBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xffE5E7EB),
          borderRadius: BorderRadius.circular(
            16.r,
          ).copyWith(topRight: Radius.circular(4.r)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) => _typingDot(i)),
        ),
      ),
    );
  }

  Widget _typingDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 150)),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(right: 4.w),
      width: 6.w,
      height: 6.w,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        shape: BoxShape.circle,
      ),
    );
  }
}
