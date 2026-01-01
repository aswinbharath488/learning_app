import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/modules/home/widgets/banner_card.dart';
import 'package:learning_app/modules/home/widgets/bottam.dart';
import 'package:learning_app/modules/home/widgets/help_section.dart';
import 'package:learning_app/modules/home/widgets/home_header.dart';
import '../../core/constants/app_colors.dart';
import '../../routes/app_routes.dart';
import 'widgets/active_course_card.dart';
import 'widgets/category_chips.dart';
import 'widgets/popular_courses.dart';
import 'widgets/live_class_card.dart';
import 'widgets/community_card.dart';
import 'widgets/testimonial_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const HomeBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 20),
              BannerCard(),
              SizedBox(height: 20),
              ActiveCourseCard(),
              SizedBox(height: 20),
              PopularCourses(),
              SizedBox(height: 20),
              LiveClassCard(),
              SizedBox(height: 20),
              CommunityCard(),
              SizedBox(height: 20),
              TestimonialSection(),
              SizedBox(height: 20),
              HelpSection(),
            ],
          ),
        ),
      ),
    );
  }
}