import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';

class Colum extends StatelessWidget {
  final double height;
  final Icon icon;
  final Color color;

  const Colum({super.key, required this.height, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          height.toStringAsFixed(0),
          style: GoogleFonts.rubikBubbles(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Define.strongPurple),
        ),
        Container(
          width: 75,
          height: height,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
          ),
        ),

        IconButton(
          onPressed: _nothing,
            icon: icon,
            color: Define.strongPurple,
        )
      ],
    );
  }

  void _nothing() {
  }
}
