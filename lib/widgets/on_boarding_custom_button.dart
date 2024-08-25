import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingCustomButton extends StatelessWidget {
  final String buttonText;
  final bool isShowArrowIcon;
  final void Function()? onTap;
  const OnBoardingCustomButton(
      {super.key, required this.buttonText, required this.isShowArrowIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: Get.width - 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: greenColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                  color: whiteColor,
                  fontFamily: ralewayBold,
                  fontSize: 20,
                  letterSpacing: 1.0),
            ),
            const SizedBox(
              width: 5.0,
            ),
            if (isShowArrowIcon)
              const Icon(
                Icons.arrow_forward,
                color: whiteColor,
              )
          ],
        ),
      ),
    );
  }
}
