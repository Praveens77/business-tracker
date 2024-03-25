import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_utils.dart';
import 'package:track_business/components/textfeild.dart';
import 'package:track_business/screens/details/details_controller.dart';

class SetupView extends StatelessWidget {
  final DetailsController controller = Get.put(DetailsController());
  SetupView({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> argumentsList = Get.arguments ?? [];
    final Map<String, String> arguments =
        argumentsList.isNotEmpty ? argumentsList[0] : {};
    final String firstName = arguments['fname'] ?? '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText("Account Setup", 18, black, FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(20),
              customText("Hi $firstName,\nLet’s setup your business account.",
                  16, black, FontWeight.w600),
              gapH(20),
              customText("Enter your business registered email id.", 16, grey,
                  FontWeight.w600),
              gapH(20),
              customTextField(emailController, "Business Email", false, ""),
              gapH(30),
              const Spacer(),
              Center(
                child: customButton(context, () {
                  if (emailController.text.length < 7) {
                    mySnackbar("Enter valid email",
                        "Please enter a valid email (min. 7 char)");
                    if (formKey.currentState!.validate()) {}
                  } else {
                    // route user
                    Get.toNamed('splash', arguments: [
                      {
                        'fname': firstName,
                      }
                    ]);
                  }
                }, "Continue", theme, black, screenWidth(context) / 1.2,
                    black, true),
              ),
              gapH(10)
            ],
          ),
        ),
      ),
    );
  }
}
