import 'package:flutter/material.dart';
import 'package:learning_app/core/constants/app_colors.dart';

import '../videos/video_view.dart';
import 'streak_path_painter.dart';

class StreakView extends StatelessWidget {
  const StreakView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:AppColors.streakBg,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              // PATH
              Positioned.fill(
                child: CustomPaint(
                  painter: StreakPathPainter(),
                ),
              ),

              // DAYS
              _dayBubble("Day\n1", left: 150, top: 620),
              _dayBubble("Day\n2", left: 220, top: 560),
              _dayBubble("Day\n3", left: 140, top: 500),
              _dayBubble("Day\n4", left: 200, top: 430),
              _dayBubble("Day\n5", left: 160, top: 360, active: true),
              _dayBubble("Day\n6", left: 120, top: 290),
              _dayBubble("Day\n7", left: 160, top: 220),
              _dayBubble("Day\n8", left: 220, top: 160),

              // TODAY POPUP
              Positioned(
                left: 180,
                top: 310,
                child: _todayPopup(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _dayBubble(
      String text, {
        required double left,
        required double top,
        bool active = false,
      }) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: primaryTeal,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _todayPopup() {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryTeal,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today’s Topic",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          SizedBox(height: 6),
          Text(
            "Core Module\nCore Module",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
