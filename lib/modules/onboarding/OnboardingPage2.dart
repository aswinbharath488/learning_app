import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import 'curved_clipper.dart';
import 'onboarding_controller.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // TOP IMAGE AREA
          Stack(
            children: [
              Container(
                height: size.height * 0.55,
                width: double.infinity,
                color: AppColors.primaryTeal,
                child: SafeArea(
                  child: Image.asset(
                    'assets/images/second.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // CURVE
              Positioned(
                bottom: -1,
                child: ClipPath(
                  clipper: CurvedClipper(),
                  child: Container(
                    height: 120,
                    width: size.width,
                    color: Colors.white,
                  ),
                ),
              ),

              // CENTER ICON
              Positioned(
                bottom: 55,
                left: size.width / 2 - 22,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.primaryTeal,
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // TITLE
          const Text(
            "Learn. Practice.\nSucceed.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          // DESCRIPTION
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              "Structured content, mock tests, and progress tracking in one place.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // PAGE DOTS (2nd ACTIVE)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(false),
              _dot(true),
              _dot(false),
            ],
          ),

          const Spacer(),

          // NEXT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // SKIP
          TextButton(
            onPressed: controller.skip,
            child: const Text(
              "Skip",
              style: TextStyle(
                color: AppColors.primaryTeal,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryTeal : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
