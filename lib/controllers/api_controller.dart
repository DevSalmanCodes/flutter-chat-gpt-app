import 'package:chat_gpt_flutter/services/api_service.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var messages = <Map<String, String>>[].obs;
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();

  void chatWithAI(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});
    isLoading.value = true;
    final content = await _apiService.chatWithAI(prompt);
    messages.add(content);
    isLoading.value = false;
  }
}
