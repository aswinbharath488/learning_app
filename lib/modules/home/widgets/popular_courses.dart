import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'course_card.dart';
import 'course_chip.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Popular Courses",
                style: TextStyle(fontWeight: FontWeight.w600)),
            Text("View all", style: TextStyle(color: AppColors.primaryTeal)),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            CourseChip("KTET", true),
            CourseChip("HST", false),
            CourseChip("CUET", false),
            CourseChip("LPST", false),
            CourseChip("GENERAL PSC", false),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CourseCard("Lower Primary"),
            CourseCard("Upper Primary"),
            CourseCard("Higher Secondary"),
            CourseCard("Language Teachers"),
          ],
        ),
      ],
    );
  }
}
