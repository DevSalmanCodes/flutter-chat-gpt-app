import 'package:chat_gpt_flutter/controllers/app_controller.dart';
import 'package:chat_gpt_flutter/views/home_view.dart';
import 'package:chat_gpt_flutter/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final appController = Get.put(AppController());
  @override
  void initState() {
    _delayAndNavigate();
    super.initState();
  }

  _delayAndNavigate() async {
    final status = await appController.getUserStatus();
    await Future.delayed(const Duration(milliseconds: 2500), () {
      if (status == true) {
        Get.offAll(() => const OnBoardingView());
      } else {
        Get.offAll(() => HomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SvgPicture.asset(
          'assets/icons/gpt_icon.svg',
          height: 90,
        ),
      )),
    );
  }
}
