import 'package:flutter/material.dart';

class TextStyleUtils {

  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );

  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w400
  );

  static final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400
  );

  static final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
  );

}
