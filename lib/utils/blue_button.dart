import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BlueButtonState();

  final String content;

  BlueButton({required this.content});

}

class _BlueButtonState extends State<BlueButton>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: Define.nothing,
        child: Text(
          widget.content,
          style: GoogleFonts.rubikBubbles(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Define.strongPurple),
        ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Define.strongBlue,
          side: BorderSide(color: Define.strongPurple, width: 1),
          elevation: 5),
    );
  }

}