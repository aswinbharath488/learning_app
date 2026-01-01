import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("General Community",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text("2,847 active members"),
            const SizedBox(height: 10),
            const Text(
              "Connect with learners across all courses. Share experiences.",
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightTeal,
              ),
              child: const Text("Join Discussion",
                  style: TextStyle(color: AppColors.primaryTeal)),
            )
          ],
        ),
      ),
    );
  }
}
