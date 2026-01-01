import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CourseChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CourseChip(
      this.title,
      this.isSelected, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryTeal
            : AppColors.chipInactive,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: isSelected
              ? AppColors.white
              : AppColors.primaryTeal,
        ),
      ),
    );
  }
}
