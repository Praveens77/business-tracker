import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:track_business/components/app_utils.dart';

class SetupSplash extends StatelessWidget {
  const SetupSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> argumentsList = Get.arguments ?? [];
    final Map<String, String> arguments =
        argumentsList.isNotEmpty ? argumentsList[0] : {};
    final String firstName = arguments['fname'] ?? '';

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/company', arguments: [
        {'fname':firstName}
      ]);
    });
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.inkDrop(
              color: const Color(0xFFEA3799),
              size: 100,
            ),
            gapH(70),
            paragraphText(
              "SETTING UP YOUR \nACCOUNT",
              20,
              black,
              FontWeight.bold,
              TextAlign.center,
              "Ubuntu",
            ),
            gapH(25),
            paragraphText(
              "This might take a while",
              16,
              grey,
              FontWeight.bold,
              TextAlign.center,
              "Ubuntu",
            )
          ],
        ),
      ),
    );
  }
}
