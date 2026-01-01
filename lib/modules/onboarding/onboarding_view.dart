import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'OnboardingPage2.dart';
import 'onboarding_controller.dart';
import 'onboarding_page1.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: const [
          OnboardingPage1(),
          OnboardingPage2(),
        ],
      ),
    );
  }
}
