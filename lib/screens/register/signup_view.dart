import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_utils.dart';
import 'package:track_business/screens/register/signup_controller.dart';

class SignUp extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  SignUp({super.key});

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText("Create your Account", 18, black, FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH(20),
              customText("Please enter your mobile number:", 16, black,
                  FontWeight.w600),
              gapH(20),
              TextFormField(
                controller: phoneController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 5),
                  hintText: "Mobile Number",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        7.0),
                    borderSide: const BorderSide(
                        width: 0.5,
                        color: grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        7.0),
                    borderSide: const BorderSide(
                        width: 0.5,
                        color: grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    mySnackbar(
                        "Enter Phone Number", 'Please enter a phone number');
                  } else if (value.length != 10) {
                    mySnackbar("Invalid Format",
                        'Phone number should be exactly 10 digits long');
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    mySnackbar("Invalid Format", "Phone number is not valid");
                  }
                  return null;
                },
              ),
              gapH(30),
              Obx(
                () => Row(
                  children: [
                    Column(
                      children: [
                        Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            Get.find<SignUpController>().isChecked.value =
                                value ?? false;
                          },
                        ),
                        gapH(18),
                      ],
                    ),
                    SizedBox(
                        width: screenWidth(context) / 1.3,
                        child: customText(
                            "Enable WhatsApp permission to send reminders, updates.",
                            15.0,
                            black,
                            FontWeight.w600)),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: customButton(context, () {
                  final phoneNumber = "+91${phoneController.text}";
                  if (phoneNumber.length < 13) {
                    if (formKey.currentState!.validate()) {}
                  } else {
                    // route user
                    Get.toNamed('otp', arguments: [
                      {'phone' : phoneNumber}
                    ]);
                  }
                }, "Send OTP", theme, black, screenWidth(context) / 1.2, black,
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
