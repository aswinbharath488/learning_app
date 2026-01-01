import 'package:get/get.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/home/home_view.dart';
import '../modules/videos/video_controller.dart';
import '../modules/videos/video_view.dart';
import '../modules/streak/streak_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(
      name: AppRoutes.videos,
      page: () =>  VideoView(),
      binding: BindingsBuilder(() {
        Get.put(VideoController());
      }),
    ),
    GetPage(name: AppRoutes.streak, page: () => StreakView()),
  ];
}
