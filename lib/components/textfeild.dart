import 'package:flutter/material.dart';
import 'package:track_business/components/app_utils.dart';

TextFormField customTextField(ctr, String txt, bool isObscure, icon) {
  return TextFormField(
    controller: ctr,
    obscureText: isObscure,
    style: const TextStyle(
      fontSize: 16.0,
      color: black,
      fontWeight: FontWeight.w600,
      fontFamily: 'Ubuntu',
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 5),
      hintText: txt,
      hintStyle: const TextStyle(
        color: Colors.black45,
        fontSize: 14,
        fontFamily: 'Ubuntu',
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(width: 0.5, color: grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
        borderSide: const BorderSide(width: 0.5, color: grey),
      ),
    ),
  );
}

TextFormField paragraphTextField(ctr, String txt, bool isObscure, icon) {
  return TextFormField(
    maxLines: 3,
    controller: ctr,
    obscureText: isObscure,
    decoration: InputDecoration(
      suffixIcon: isObscure ? icon : const SizedBox(),
      suffixIconConstraints: const BoxConstraints(
        minHeight: 15,
        minWidth: 15,
      ),
      filled: true,
      fillColor: white,
      hintText: txt,
      hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w100),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: grey, width: 1.2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: grey,
        ),
      ),
    ),
  );
}
