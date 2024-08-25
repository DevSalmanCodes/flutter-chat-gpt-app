import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:chat_gpt_flutter/controllers/app_controller.dart';
import 'package:chat_gpt_flutter/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: primaryColor,
        ),
        home: const SplashView());
  }
}
