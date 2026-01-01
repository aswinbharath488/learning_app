import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ActiveCourseCard extends StatelessWidget {
  const ActiveCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Active Courses",
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "KTET – Language Teachers",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 6),
              const Text(
                "70/100 Tests",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryTeal,
                      ),
                      child: const Text("Continue >>>"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Shift Course"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
