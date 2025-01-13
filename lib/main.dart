import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/screen/flash_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Get.put(UserIDController());
  runApp(GetMaterialApp(
      theme: ThemeData(
          inputDecorationTheme:
              const InputDecorationTheme(suffixIconColor: Define.strongPurple)),
      home: FlashScreen()));
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}