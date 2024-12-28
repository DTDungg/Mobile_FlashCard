import 'package:flutter/material.dart';
import 'package:mobile_flash_card/bottom_bar.dart';
import 'package:mobile_flash_card/flash_screen.dart';
import 'package:mobile_flash_card/home_screen.dart';
import 'package:mobile_flash_card/signin_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Define.strongPurple
        )
      ),
      home: FlashScreen()
    );
  }
}
