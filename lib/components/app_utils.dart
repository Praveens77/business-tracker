// app colors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:track_business/components/app_images.dart';

const black = Color(0xFF18181B);
const white = Color(0xFFFFFFFF);
const theme = Color(0xFF4BFFB3);
const lightTheme = Color(0xFFAFFFDD);
const blue = Color(0xFF254EDB);
const grey = Colors.grey;
const lightgrey = Color(0xFFF9F5FF);
const orange = Color(0xFFFF7029);

// App Sizes
SizedBox gapH(double value) => SizedBox(height: value);
SizedBox gapW(double value) => SizedBox(width: value);
screenSize(BuildContext context) => MediaQuery.of(context).size;
screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

// App Texts
Text customText(String txt, double size, Color clr, FontWeight weight) {
  return Text(
    txt,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: "Jakarta"),
  );
}

// Paragraph Text
Text paragraphText(String txt, double size, Color clr, FontWeight weight,
    TextAlign align, String family) {
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
        color: clr, fontSize: size, fontWeight: weight, fontFamily: family),
  );
}

// App Buttons
InkWell customButton(
    BuildContext context, clk, txt, btnclr, txtclr, width, bodrclr, arrow) {
  return InkWell(
    onTap: clk,
    child: Container(
      height: screenHeight(context) * 0.06,
      width: width,
      decoration: BoxDecoration(
          color: btnclr,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: bodrclr)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customText(txt, 16.0, txtclr, FontWeight.w600),
          arrow ? gapW(20) : const SizedBox(),
          arrow ? SvgPicture.asset(ImagePath.arrow) : const SizedBox()
        ],
      ),
    ),
  );
}

//custom snackbar
mySnackbar(String msg, subtxt) {
  return Get.snackbar(
    msg,
    subtxt,
    colorText: black,
    snackPosition: SnackPosition.TOP,
    borderColor: black,
    borderWidth: 1.2,
    backgroundColor: white,
    backgroundGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [lightTheme, white],
    ),
  );
}
