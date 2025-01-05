import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueButton extends StatelessWidget{

  final String content;
  final double w;

  const BlueButton({super.key, required this.content, required this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Define.strongBlue,
        border: Border.all(
          color: Define.strongPurple,
          width: 1
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Text(
          content,
          style: GoogleFonts.rubikBubbles(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Define.strongPurple),
        ),
      ),
    );
  }
}
