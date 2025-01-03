import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';

class CardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CardScreenState();

  final String idName;
  final bool isPublic;

  const CardScreen({super.key,required this.idName, required this.isPublic});

}

class _CardScreenState extends State<CardScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.idName,
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Define.strongPurple),
              ),
              Icon(
                widget.isPublic ? Icons.public : Icons.lock,
                color: Define.strongPurple,
              )
            ],
          ),
          FindBar(),
          Row(
            children: [
              BlueButton(content: 'Delete',),
              const SizedBox(width: 10,),
              BlueButton(content: 'Add to'),
              const SizedBox(width: 10,),
              BlueButton(content: 'Review'),
              const SizedBox(width: 10,),
              BlueButton(content: 'Sort')
            ],
          ),
          Container(
              width: 330,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border:
                  Border.all(color: Define.strongPurple, width: 2)),
              child: const IconButton(
                icon: Icon(Icons.add),
                color: Define.strongPurple,
                onPressed: Define.nothing,
              )
          ),
        ],
      ),
    );
  }

}