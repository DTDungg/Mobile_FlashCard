import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/signin_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';

class FlashScreen extends StatefulWidget {
  FlashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  void _start() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignIn_Screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
                width: 400,
                height: 400,
                child: Image(
                    image:
                        AssetImage('assets/images/flash-card-background.png'))),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: _start,
              child: Text(
                'START',
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Define.lightPurple,
                  side: BorderSide(color: Define.strongPurple, width: 1),
                  elevation: 5),
            )
          ],
        )));
  }
}
