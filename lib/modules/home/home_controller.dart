import 'package:get/get.dart';
import '../../core/services/api_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;

  var activeCourse = {}.obs;
  var categories = [].obs;
  var popularCourses = [].obs;
  var liveClass = {}.obs;
  var community = {}.obs;
  var testimonial = {}.obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading(true);
      isError(false);

      final response = await ApiService.getHome();

      activeCourse.value = response['active_course'] ?? {};
      categories.value = response['categories'] ?? [];
      popularCourses.value = response['popular_courses'] ?? [];
      liveClass.value = response['live_class'] ?? {};
      community.value = response['community'] ?? {};
      testimonial.value = response['testimonial'] ?? {};
    } catch (e) {
      isError(true);
    } finally {
      isLoading(false);
    }
  }
}
