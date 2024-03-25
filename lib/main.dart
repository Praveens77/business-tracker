import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_business/screens/companies/company_view.dart';
import 'package:track_business/screens/details/details_view.dart';
import 'package:track_business/screens/details/setup_view.dart';
import 'package:track_business/screens/home/home_view.dart';
import 'package:track_business/screens/onboarding/onboard_view.dart';
import 'package:track_business/screens/register/signup_view.dart';
import 'package:track_business/screens/register/verify_otp.dart';
import 'package:track_business/screens/splash/setup_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Business Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: '/onBoarding',
        getPages: [
          GetPage(name: '/onBoarding', page: () => OnBoardingView()),
          GetPage(name: '/signup', page: () => SignUp()),
          GetPage(name: '/otp', page: () => OTPVerificationView()),
          GetPage(name: '/details', page: () => DetailsView()),
          GetPage(name: '/setup', page: () => SetupView()),
          GetPage(name: '/splash', page: () => const SetupSplash()),
          GetPage(name: '/company', page: () => CompaniesView()),
          GetPage(name: '/home', page: () => const HomeScreen()),
        ]);
  }
}
