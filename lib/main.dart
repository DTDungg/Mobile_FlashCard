import 'package:flutter/material.dart';
import 'package:mobile_flash_card/flash_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
          inputDecorationTheme:
              InputDecorationTheme(suffixIconColor: Define.strongPurple)),
      home: FlashScreen()));
}
