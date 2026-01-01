import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleCont extends GetxController {
  Locale locale = const Locale('en', "EN");
  updateLocale(Locale a) {
    locale = a;
    update();
  }
}
