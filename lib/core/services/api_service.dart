import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://trogon.info/task/api/";

  static Future<dynamic> getHome() async {
    final res = await http.get(Uri.parse("${baseUrl}home.php"));
    return jsonDecode(res.body);
  }

  static Future<dynamic> getVideos() async {
    final res = await http.get(Uri.parse("${baseUrl}video_details.php"));
    return jsonDecode(res.body);
  }

  static Future<dynamic> getStreak() async {
    final res = await http.get(Uri.parse("${baseUrl}streak.php"));
    return jsonDecode(res.body);
  }
}
