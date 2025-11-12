import 'dart:async';
import 'dart:math';

import 'package:autosync/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAiScreen extends StatefulWidget {
  const MyAiScreen({super.key});

  @override
  State<MyAiScreen> createState() => _MyAiScreenState();
}

class _MyAiScreenState extends State<MyAiScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Random _random = Random();

  // Chat messages
  List<Map<String, dynamic>> _messages = [];

  bool _isTyping = false;
  Timer? _typingTimer;
  Timer? _replyTimer;

  // AI reply pool
  final List<String> _aiReplies = [
    "I found 3 BMW G0310R units in stock at Jimenez Motorsports.",
    "The 2025 model is available for test drive tomorrow at 10 AM.",
    "Oil change + inspection package is \$89. Book now?",
    "We have 2 units of the BMW G0310R in black and silver.",
    "Yes, we offer financing at 2.9% APR for qualified buyers.",
    "The nearest store is 2.1 miles away. Want directions?",
    "Maintenance history for VIN 1HGBH41JXMN109186 is clean.",
    "Tire rotation + alignment is \$120. Recommended every 6 months.",
    "We accept trade-ins. Bring your current vehicle for appraisal.",
    "Estimated delivery: 3–5 business days after order.",
  ];

  @override
  void initState() {
    super.initState();
    // Optional: Show welcome message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addMessage("Hi! I'm your AI Assistant. I can check product & vehicle availability.", false);
      _scrollToBottom();
    });
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

    _addMessage(text, true);
    _controller.clear();

    // Start AI reply simulation
    _startAIResponse();
  }

  void _addMessage(String text, bool isMe) {
    setState(() {
      _messages.add({
        'text': text,
        'isMe': isMe,
        'time': _formatTime(DateTime.now()),
      });
    });
    _scrollToBottom();
  }

  void _startAIResponse() {
    setState(() => _isTyping = true);

    // Show typing after 800ms
    _typingTimer = Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _messages.add({'text': null, 'isMe': false});
      });
      _scrollToBottom();
    });

    // Send reply after 1.5–3.5 sec
    final delay = 1500 + _random.nextInt(2000);
    _replyTimer = Timer(Duration(milliseconds: delay), () {
      setState(() {
        _messages.removeWhere((m) => m['text'] == null);
        final reply = _aiReplies[_random.nextInt(_aiReplies.length)];
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
        title: Text(
          'AI Assistant',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xff030712),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      endDrawer: _buildDrawer(),
      body: Column(
        children: [
          // Chat Area
          Expanded(
            child: _messages.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      final isMe = msg['isMe'] as bool;
                      final text = msg['text'] as String?;

                      // Typing Indicator
                      if (text == null) return _buildTypingBubble();

                      return _buildChatBubble(text, isMe, msg['time']);
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
              enabled: !_isTyping,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: _isTyping ? 'AI is thinking...' : 'Ask Anything...',
                hintStyle: TextStyle(color: _isTyping ? Colors.grey[400] : Colors.grey),
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
                    onpress: _isTyping ? null : _sendMessage,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  // Empty state (before first message)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.smart_toy_outlined, size: 64.sp, color: Colors.grey[400]),
          SizedBox(height: 16.h),
          Text(
            'Ask me about vehicles, parts, or services!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Chat bubble
  Widget _buildChatBubble(String text, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.75.sw),
        margin: EdgeInsets.only(
          top: 8.h,
          bottom: 4.h,
          left: isMe ? 40.w : 0,
          right: isMe ? 0 : 40.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xff3B82F6) : const Color(0xffE5E7EB),
          borderRadius: BorderRadius.circular(16.r).copyWith(
            topLeft: isMe ? Radius.circular(16.r) : Radius.circular(4.r),
            topRight: isMe ? Radius.circular(4.r) : Radius.circular(16.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: isMe ? Colors.white : const Color(0xff030712),
                height: 1.3,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 10.sp,
                color: isMe ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Typing indicator
  Widget _buildTypingBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xffE5E7EB),
          borderRadius: BorderRadius.circular(16.r).copyWith(topRight: Radius.circular(4.r)),
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

  // Drawer
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 50.h),
          ListTile(
            leading: Image.asset('assets/icons/edit1.png', height: 24.h),
            title: Text(
              'Edit Profile',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff374151),
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Image.asset('assets/icons/edit.png', height: 24.h),
            title: Text(
              'History',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: const Color(0xff374151),
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}