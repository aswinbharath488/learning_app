import 'package:get/get.dart';
import '../../core/services/api_service.dart';

class StreakController extends GetxController {
  var days = [].obs;

  @override
  void onInit() {
    fetchStreak();
    super.onInit();
  }

  Future<void> fetchStreak() async {
    final response = await ApiService.getStreak();
    days.value = response['days'] ?? [];
  }
}
