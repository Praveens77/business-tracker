import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_images.dart';
import 'package:track_business/components/app_utils.dart';
import 'package:track_business/screens/companies/company_controller.dart';

class CompaniesView extends StatelessWidget {
  final CompaniesController controller = Get.put(CompaniesController());
  final List<String> imagePaths = [
    ImagePath.google,
    ImagePath.amazon,
    ImagePath.microsoft,
    ImagePath.facebook,
  ];

  CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
     final List<Map<String, String>> argumentsList = Get.arguments ?? [];
    final Map<String, String> arguments =
        argumentsList.isNotEmpty ? argumentsList[0] : {};
    final String firstName = arguments['fname'] ?? '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customText("Select Companies", 18, black, FontWeight.w700),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          gapH(20),
          Expanded(
            child: ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                String imagePath = imagePaths[index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth(context) / 1.8,
                          height: 60,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [lightTheme, white])),
                          child: Center(
                            child: Image.asset(
                              imagePath,
                            ),
                          ),
                        ),
                        gapW(20),
                        Obx(
                          () => Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              side: const BorderSide(
                                width: 0.7,
                              ),
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              value:
                                  controller.isChecked[imagePath]?.value ?? false,
                              onChanged: (value) {
                                controller.toggleCompany(imagePath);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          gapH(20),
          Center(
              child: customButton(context, () {
                Get.toNamed('home' , arguments: [
                      {
                        'fname': firstName,
                      }
                    ]);
              }, "Continue", theme, black,
                  screenWidth(context) / 1.2, black, true)),
          gapH(20)
        ],
      ),
    );
  }
}
