import 'package:flutter/material.dart';
import '../../../core/widgets/shimmer_box.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ShimmerBox(height: 100),
        SizedBox(height: 16),
        ShimmerBox(height: 80),
        SizedBox(height: 16),
        ShimmerBox(height: 200),
      ],
    );
  }
}
