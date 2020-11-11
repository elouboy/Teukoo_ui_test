import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0XFF242A37);
  static const Color greyBackground = Color(0XFFF0F0F0);
  static const Color iconBackground = Color(0XFF4A505D);

  static LinearGradient camButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0XFFF10068),
      Color(0XFFE1006B),
      Color(0XFFD4006D),
      Color(0XFFBA0072),
      Color(0XFFB80073),
      Color(0XFFA20077),
      Color(0XFF86007D),
      Color(0XFF7B007F),
      Color(0XFF76007F),
    ],
  );
}
