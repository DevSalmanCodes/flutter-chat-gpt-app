import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:chat_gpt_flutter/type_defs.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  var onBoardingIndex = 0.obs;

  FutureVoid changeUserStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('isNewUser', false);
  }

  Future<bool?> getUserStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool('isNewUser') ?? true;
  }

  void incrementIndex() {
    if (onBoardingIndex.value != onBoardingFirstTexts.length - 1) {
      onBoardingIndex.value++;
    }
  }
}
