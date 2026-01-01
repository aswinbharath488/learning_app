import 'package:flutter/material.dart';

class LiveClassCard extends StatelessWidget {
  const LiveClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9B3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text("Live",
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fundamentals",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text("Session 3 • 10 Dec 10:00 PM"),
              ],
            ),
          ),
          OutlinedButton(onPressed: () {}, child: const Text("Join Now"))
        ],
      ),
    );
  }
}
