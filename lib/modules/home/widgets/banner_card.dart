import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient:  LinearGradient(
          colors: [AppColors.primaryTeal, AppColors.darkBlue],
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Master New Skills\nAnytime, Anywhere",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.asset(
              'assets/images/happy-students-working-together-laptop_13339-102938.png',
              width: 140,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
