import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingBox extends StatelessWidget {
  final String firstText;
  final String secondText;
  const OnBoardingBox(
      {super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 8.0),
      width: Get.width - 40,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: secondryColor, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          Text(
            '“$firstText',
            style: const TextStyle(
                color: Colors.white, fontFamily: ralewayMedium, fontSize: 15.0),
          ),
          Text('$secondText”',
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: ralewayMedium,
                  fontSize: 15.0)),
        ],
      ),
    );
  }
}
