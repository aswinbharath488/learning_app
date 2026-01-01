import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("What Learners Are Saying",
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "This course completely transformed my approach to learning.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
