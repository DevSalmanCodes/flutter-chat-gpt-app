import 'package:chat_gpt_flutter/constants/constants.dart';
import 'package:chat_gpt_flutter/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _controller;
  final _apiController = Get.put(ApiController());
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSendRequest() {
    final text = _controller.text.trim();
    _apiController.chatWithAI(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 30.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: SvgPicture.asset(
            gptIcon,
            height: 40,
          ),
        ),
        body: Obx(() {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: _apiController.messages.length,
                      itemBuilder: (context, index) {
                        final message = _apiController.messages[index];

                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: message['role'] == 'user'
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              if (message['role'] != 'user')
                                SvgPicture.asset(
                                  gptIcon,
                                  height: 30,
                                ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                constraints: BoxConstraints(
                                  maxWidth: Get.width / 2,
                                ),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: secondryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Text(
                                  message['content'] ?? '',
                                  style: const TextStyle(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              right: 10.0,
              left: 10,
              bottom: MediaQuery.viewInsetsOf(context).bottom + 10.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: secondryColor, borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(color: whiteColor),
                  controller: _controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Message... ',
                      hintStyle: TextStyle(color: whiteColor)),
                ),
              ),
              GestureDetector(
                onTap: _onSendRequest,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: SvgPicture.asset(
                    'assets/icons/send_icon.svg',
                    height: 22.0,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
