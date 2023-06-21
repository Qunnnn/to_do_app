import 'package:flutter/material.dart';

class AppLayout {
  static getHeight({required BuildContext context, required pixel}) {
    final x = MediaQuery.of(context).size.height / pixel;
    return MediaQuery.of(context).size.height / x;
  }
    static getWidth({required BuildContext context, required pixel}) {
    final x = MediaQuery.of(context).size.width / pixel;
    return MediaQuery.of(context).size.width / x;
  }
}
