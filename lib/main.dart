import 'package:flutter/material.dart';
import 'package:mobile_flash_card/screen/home_screen.dart';
import 'package:mobile_flash_card/screen/play_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
          inputDecorationTheme:
              const InputDecorationTheme(suffixIconColor: Define.strongPurple)),
      home: PlayScreen()));
}
