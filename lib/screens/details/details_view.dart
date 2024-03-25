import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_utils.dart';
import 'package:track_business/components/textfeild.dart';
import 'package:track_business/screens/details/details_controller.dart';

class DetailsView extends StatelessWidget {
  final DetailsController controller = Get.put(DetailsController());
  DetailsView({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText("Enter Details", 18, black, FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(20),
              customText(
                  "Please tell us your name.", 16, black, FontWeight.w600),
              gapH(20),
              customTextField(firstNameController, "First Name", false, ""),
              gapH(20),
              customTextField(lastNameController, "Last Name", false, ""),
              gapH(30),
              const Spacer(),
              Center(
                child: customButton(context, () {
                  if (firstNameController.text.length < 3 ||
                      lastNameController.text.isEmpty) {
                    mySnackbar("Enter valid name", "Please enter a valid full name (min. 3 char)");
                    if (formKey.currentState!.validate()) {}
                  } else {
                    // route user
                    Get.toNamed('setup', arguments: [
                      {
                        'fname': firstNameController.text,
                        'lname': lastNameController.text,
                      }
                    ]);
                  }
                }, "Continue", theme, black, screenWidth(context) / 1.2, black,
                    true),
              ),
              gapH(10)
            ],
          ),
        ),
      ),
    );
  }
}
