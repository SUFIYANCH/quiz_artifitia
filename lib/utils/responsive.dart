import 'package:flutter/material.dart';

class R {
  static double sh(double h, BuildContext context) {
    return MediaQuery.of(context).size.height * (h / 810);
  }

  static double sw(double w, BuildContext context) {
    return MediaQuery.of(context).size.width * (w / 375);
  }
}
