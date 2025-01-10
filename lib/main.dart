import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_flash_card/screen/home_screen.dart';
import 'package:mobile_flash_card/screen/library_screen.dart';
import 'package:mobile_flash_card/screen/play_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(GetMaterialApp(
      theme: ThemeData(
          inputDecorationTheme:
              const InputDecorationTheme(suffixIconColor: Define.strongPurple)),
      home: HomeScreen(userID: 2,)));
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}