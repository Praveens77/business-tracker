import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_images.dart';
import 'package:track_business/components/app_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> argumentsList = Get.arguments ?? [];
    final Map<String, String> arguments =
        argumentsList.isNotEmpty ? argumentsList[0] : {};
    final String firstName = arguments['fname'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: customText(firstName, 18, black, FontWeight.bold),
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: CircleAvatar(
            radius: 4,
            child: SvgPicture.asset(ImagePath.profile),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 18,
              child: SvgPicture.asset(ImagePath.notification),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(20),
            paragraphText("Hello $firstName !!", 20, black, FontWeight.w900,
                TextAlign.left, "Ubuntu"),
            gapH(7),
            customText(
                "Welcome to your Business Tracker app.", 17, black, FontWeight.w600),
            gapH(50),
            SizedBox(
              width: screenWidth(context) / 1.2,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Explore the Business ",
                      style: TextStyle(
                          color: black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "World",
                      style: TextStyle(
                          color: orange,
                          fontSize: 38,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
                child: Column(
              children: [
                Container(
                    height: screenHeight(context)/3,
                    width: screenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: black, width: 1.2),
                      image: DecorationImage(image: AssetImage(ImagePath.home),
                    fit: BoxFit.cover,)
                    ),
                  ),
                gapH(7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Google Inc.", 14, grey, FontWeight.bold),
                    Row(
                      children: [
                        const Icon(Icons.star, color: orange, size: 20),
                        gapW(3),
                        customText("4.7", 14, grey, FontWeight.bold),
                      ],
                    ),
                  ],
                )
              ],
            )),
            const Spacer(),
            Center(
              child: customButton(context, () {
                Get.offNamed('onBoarding');
              }, "LOG OUT", theme, black, screenWidth(context) / 1.2, black,
                  false),
            ),
          ],
        ),
      ),
    );
  }
}
