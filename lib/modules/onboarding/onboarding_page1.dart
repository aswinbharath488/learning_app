import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import 'curved_clipper.dart';
import 'onboarding_controller.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // TOP IMAGE SECTION
          Stack(
            children: [
              Container(
                height: size.height * 0.55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryTeal,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: Image.asset(
                          'assets/images/1184 1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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
                  child: Image.asset(
                    'assets/images/Frame 1171284289.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // TITLE
          const Text(
            "Smarter Learning\nStarts Here",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          // DESCRIPTION
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Personalized lessons that adapt to your pace and goals.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // DOT INDICATOR
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
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:controller.nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
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

  Widget _dot(bool active) {
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
