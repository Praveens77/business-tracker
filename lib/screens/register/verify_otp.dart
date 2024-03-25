import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:track_business/components/app_utils.dart';

// ignore: must_be_immutable
class OTPVerificationView extends StatelessWidget {
  String? phone;
  final TextEditingController _otpController = TextEditingController();

  bool isResendActive = false;
  Timer? timer;
  static const countdownSeconds = 60;
  final countdownSeconds0 = countdownSeconds.obs;
  RxBool isResending = false.obs;

  OTPVerificationView({super.key, this.phone}) {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> argumentsList = Get.arguments ?? [];
    final Map<String, String> arguments =
        argumentsList.isNotEmpty ? argumentsList[0] : {};
    final String phone = arguments['phone'] ?? '';

    final isButtonEnabled = RxBool(false);

    _otpController.addListener(() {
      if (_otpController.text.length == 6) {
        isButtonEnabled.value = true;
      } else {
        isButtonEnabled.value = false;
      }
    });
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: customText("Enter OTP", 18, black, FontWeight.bold),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                "Enter OTP sent to $phone",
                16,
                black,
                FontWeight.w700,
              ),
              gapH(25.0),
              SizedBox(
                width: screenWidth(context) / 1.4,
                child: Pinput(
                  controller: _otpController,
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  defaultPinTheme: PinTheme(
                    height: 49.0,
                    width: 49.0,
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightgrey,
                      border: Border.all(
                        color: black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              gapH(30),
              Obx(
                () => Row(
                  children: [
                    const Icon(Icons.timer),
                    gapW(10),
                    customText(
                      "${countdownSeconds0.value} seconds",
                      16,
                      black,
                      FontWeight.w600,
                    ),
                  ],
                ),
              ),
              gapH(25),
              customText("Didn't receive OTP?", 16, black, FontWeight.w600),
              gapH(10),
              InkWell(
                onTap: (isResending.value ||
                        isResendActive ||
                        countdownSeconds0.value > 0)
                    ? null
                    : () {
                        isResendActive = true;
                        countdownSeconds0.value = 60;
                        startTimer();
                      },
                child: Container(
                  height: 40,
                  width: screenWidth(context) / 2.6,
                  decoration: BoxDecoration(border: Border.all(color: black)),
                  child: Center(
                    child: Obx(
                      () => customText(
                          "Resend OTP",
                          16,
                          (isResending.value ||
                                  isResendActive ||
                                  countdownSeconds0.value > 0)
                              ? Colors.black45
                              : black,
                          FontWeight.bold),
                    ),
                  ),
                ),
              ),
              gapH(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText("By proceeding you are indicating that you ", 16,
                      black, FontWeight.w600),
                  Row(
                    children: [
                      customText("have read and agree to our ", 16, black,
                          FontWeight.w600),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Terms of Use",
                          style: TextStyle(
                              fontSize: 16,
                              color: blue,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Jakarta",
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      customText(" and", 16, black, FontWeight.w600),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Jakarta",
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              gapH(screenHeight(context) / 3.5),
              customButton(context, () {
                Get.toNamed('details');
              }, "Continue", theme, black,
                  screenWidth(context), black, true),
              gapH(25),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (countdownSeconds0.value <= 0) {
        timer?.cancel();
      } else {
        countdownSeconds0.value--;
      }
    });
  }
}
