import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:chat_gpt_flutter/controllers/app_controller.dart';
import 'package:chat_gpt_flutter/views/home_view.dart';
import 'package:chat_gpt_flutter/widgets/on_boarding_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/on_boarding_custom_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final AppController _appController;

  @override
  void initState() {
    super.initState();
    _appController = Get.put(AppController());
  }

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  SvgPicture.asset(
                    'assets/icons/gpt_icon.svg',
                    color: Colors.white,
                    height: 40.0,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: ralewayBold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'ChatGPT',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: ralewayBold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Ask anything, get your answer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: ralewaySemiBold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/examples.svg',
                        height: 30.0,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Text(
                        'Examples',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ralewayMedium,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      OnBoardingBox(
                        firstText: onBoardingFirstTexts[
                            _appController.onBoardingIndex.value],
                        secondText: onBoardingSecondTexts[
                            _appController.onBoardingIndex.value],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      OnBoardingCustomButton(
                        buttonText: _appController.onBoardingIndex.value !=
                                onBoardingFirstTexts.length - 1
                            ? 'Next'
                            : "Let's Chat",
                        isShowArrowIcon: _appController.onBoardingIndex.value ==
                            onBoardingFirstTexts.length - 1,
                        onTap: _appController.onBoardingIndex.value !=
                                onBoardingFirstTexts.length - 1
                            ? _appController.incrementIndex
                            : () async {
                                await _appController.changeUserStatus();
                                Get.offAll(() =>  HomeView());
                              },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
