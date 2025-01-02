import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';

class Deck extends StatefulWidget {
  final int id;
  final String name;
  final bool isPublic;
  final String description;

  const Deck(
      {super.key,
      required this.id,
      required this.name,
      required this.description,
      required this.isPublic});

  @override
  State<StatefulWidget> createState() => _DeckState();
}

class _DeckState extends State<Deck> {
  String _fortmatID(int id) {
    if (id < 10)
      return "00" + id.toString();
    else if (id < 100)
      return "0" + id.toString();
    else
      return id.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Define.strongPurple,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                        child: Text(
                          _fortmatID(widget.id) + ": " + widget.name,
                          style: GoogleFonts.rubikBubbles(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Define.strongPurple),
                        ),
                        width: 230,
                      ),

                      Icon(
                        widget.isPublic ? Icons.public : Icons.lock,
                        color: Define.strongPurple,
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.draw,
                        color: Define.strongPurple,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(

                      widget.description,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Define.strongPurple),
                    ),
                  )
                ],
              ),
            )));
  }
}
