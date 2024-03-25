import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_images.dart';
import 'package:track_business/components/app_utils.dart';
import 'package:track_business/screens/onboarding/onboard_controller.dart';

class OnBoardingView extends StatelessWidget {
  final OnBoardingController controller = Get.put(OnBoardingController());

  OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          gapH(40),
          SizedBox(
            height: screenHeight(context) / 2,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Container(
                    height: screenHeight(context)/2.2,
                    width: screenWidth(context)/1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: black, width: 1.2),
                      image: DecorationImage(image: AssetImage(ImagePath.ob_1,),
                    fit: BoxFit.cover,)
                    ),
                  )
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    height: screenHeight(context)/2.2,
                    width: screenWidth(context)/1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(color: black, width: 1.2),
                      image: DecorationImage(image: AssetImage(ImagePath.ob_2),
                    fit: BoxFit.cover,)
                    ),
                  )
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    height: screenHeight(context)/2.2,
                    width: screenWidth(context)/1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(color: black, width: 1.2),
                      image: DecorationImage(image: AssetImage(ImagePath.ob_3),
                    fit: BoxFit.cover,)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // page 1
                    Obx(
                      () => Container(
                        width: controller.currentPageIndex.value == 0
                            ? screenWidth(context) / 15
                            : 8,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex.value == 0
                              ? blue
                              : grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    gapW(7),
                    // page 2
                    Obx(() => Container(
                          width: controller.currentPageIndex.value == 1
                              ? screenWidth(context) / 15
                              : 8,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: controller.currentPageIndex.value == 1
                                ? blue
                                : grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                    gapW(7),
                    // page 3
                    Obx(() => Container(
                          width: controller.currentPageIndex.value == 2
                              ? screenWidth(context) / 15
                              : 8,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: controller.currentPageIndex.value == 2
                                ? blue
                                : grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                    // gapW(60),
                  ],
                ),

                // Texts
                Obx(
                  () => SizedBox(
                    height: screenHeight(context) * 0.2,
                    width: screenWidth(context),
                    child: controller.currentPageIndex.value == 0
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                gapH(20),
                                paragraphText("Track your data", 24.0, black,
                                    FontWeight.w700, TextAlign.center, "Ubuntu"),
                                gapH(15),
                                paragraphText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                    14.0,
                                    grey,
                                    FontWeight.w500,
                                    TextAlign.center,
                                    "Ubuntu"),
                              ],
                            ),
                          )
                        : controller.currentPageIndex.value == 1
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    gapH(20),
                                    paragraphText("Avoid Penalties and Late Fees", 24.0,
                                        black, FontWeight.w700, TextAlign.center, "Ubuntu"),
                                    gapH(10),
                                    paragraphText(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                        14.0,
                                        grey,
                                        FontWeight.w500,
                                        TextAlign.center,
                                        "Ubuntu"),
                                  ],
                                ),
                              )
                            : Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    gapH(20),
                                    paragraphText(
                                        "All companies in single dashboard",
                                        24.0,
                                        black,
                                        FontWeight.w700,
                                        TextAlign.center,
                                        "Ubuntu"),
                                    gapH(10),
                                    paragraphText(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                        14.0,
                                        grey,
                                        FontWeight.w500,
                                        TextAlign.center,
                                        "Ubuntu"),
                                  ],
                                ),
                              ),
                  ),
                ),
              ],
            ),
          ),

          gapH(screenHeight(context) * 0.14),

          // Skip Continue Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.currentPageIndex.value == 2
                      ? const SizedBox()
                      : customButton(context, () {
                          Get.toNamed('/signup');
                        },
                          "Skip", white, black, screenWidth(context) / 2.4, black, false),
                  // gapW(20.0),
                  controller.currentPageIndex.value == 2
                      ? const SizedBox()
                      : const Spacer(),
                  customButton(context, () {
                    controller.currentPageIndex.value == 2
                        ? Get.toNamed('/signup')
                        : controller.nextPage();
                    // Get.toNamed('/signup');
                  },
                      controller.currentPageIndex.value == 2
                          ? "Continue"
                          : "Next",
                      theme,
                      black,
                      controller.currentPageIndex.value == 2
                          ? screenWidth(context) / 1.2
                          : screenWidth(context) / 2.4,
                      black, true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
