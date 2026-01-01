import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "KTET",
      "HST",
      "LPST",
      "UPST",
      "CUET",
      "PSC"
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: categories
          .map(
            (c) => Chip(
          label: Text(c),
          backgroundColor: AppColors.primaryTeal.withOpacity(.15),
        ),
      )
          .toList(),
    );
  }
}
