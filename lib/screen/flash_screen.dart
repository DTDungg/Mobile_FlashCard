import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/screen/signin_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';


class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  void _start() {
    Get.to(const SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
                width: 400,
                height: 400,
                child: Image(
                    image:
                        AssetImage('assets/images/flash-card-background.png'))),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: _start,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Define.lightPurple,
                  side: const BorderSide(color: Define.strongPurple, width: 1),
                  elevation: 5),
              child: Text(
                'START',
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white),
              ),
            )
          ],
        )));
  }
}
