import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../streak/streak_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Good Morning, Arjun",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const StreakView());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("Day 7 🔥"),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.notifications_none),
      ],
    );
  }
}
