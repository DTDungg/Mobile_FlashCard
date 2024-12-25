import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';

class FlashScreen extends StatelessWidget {
  FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 200,),
            Container(
                width: 400,
                height: 400,
                child: Image(
                    image:
                        AssetImage('assets/images/flash-card-background.png')
                )
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: _nothing,
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
        ));
  }

  void _nothing() {}
}
