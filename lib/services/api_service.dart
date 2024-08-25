import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final List<Map<String, String>> messages = [];

  Future<Map<String, String>> chatWithAI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final response = await http.post(
          Uri.parse(
            'https://chatgpt-42.p.rapidapi.com/gpt4',
          ),
          headers: {
            'x-rapidapi-key':
                '82f246812cmsh4f7a7311e5cfc6dp1d6849jsn65494a8b8eb0',
            'x-rapidapi-host': 'chatgpt-42.p.rapidapi.com',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'messages': messages,
          }));
      print(response.body);
      if (response.statusCode == 200) {
        final content = jsonDecode(response.body)['result'];

        messages.add({'role': 'assistant', 'content': content});
        return {'role': 'assistant', 'content': content};
      }

      throw 'An internal error occurred';
    } catch (e) {
      throw e.toString();
    }
  }
}
