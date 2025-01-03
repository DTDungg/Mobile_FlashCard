import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BlueButtonState();

  final String content;

  const BlueButton({super.key, required this.content});

}

class _BlueButtonState extends State<BlueButton>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: Define.nothing,
      style: ElevatedButton.styleFrom(
          backgroundColor: Define.strongBlue,
          side: const BorderSide(color: Define.strongPurple, width: 1),
          elevation: 5),
        child: Text(
          widget.content,
          style: GoogleFonts.rubikBubbles(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Define.strongPurple),
        ),
    );
  }

}