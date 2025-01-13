import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/model/card_from_client.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/model/deck_from_client.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/define.dart';

import '../service/card_service.dart';

class EditCardDialog extends StatefulWidget {
  final CardFromDB card;
  final VoidCallback edit;

  const EditCardDialog({super.key, required this.card, required this.edit});
  @override
  State<StatefulWidget> createState() => _EditCardDialogState();
}

class _EditCardDialogState extends State<EditCardDialog> {
  final TextEditingController meaningCotroller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController describeController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   isPublic = widget.isPublic;
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Text('Edit Deck',
                    style: GoogleFonts.rubikBubbles(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Define.strongPurple,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Define.lightBlue,
                labelText: 'Name',
                hintText: widget.card.front,
                labelStyle: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Define.strongPurple,
                ),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Define.strongPurple, width: 2),
                    borderRadius: BorderRadius.circular(30))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 3,
            controller: meaningCotroller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Define.lightBlue,
                hintText: widget.card.back,
                labelText: 'Meaning',
                labelStyle: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Define.strongPurple,
                ),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Define.strongPurple, width: 2),
                    borderRadius: BorderRadius.circular(30))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 3,
            controller: describeController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Define.lightBlue,
                hintText: widget.card.description,
                labelText: 'Description',
                labelStyle: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Define.strongPurple,
                ),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Define.strongPurple, width: 2),
                    borderRadius: BorderRadius.circular(30))),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: GoogleFonts.rubikBubbles(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Define.strongPurple),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              final currentContext = context;
              try {
                await CardService().UpdateCard(
                    widget.card.cardId!,
                    CardFromClient(
                        front: nameController.text,
                        back: meaningCotroller.text,
                        description: describeController.text,
                        setId: widget.card.setId));
                Navigator.of(currentContext).pop();
                widget.edit();
              } catch (e) {
                throw Exception('Failed to load data');
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Define.lightPurple,
                side: const BorderSide(color: Define.strongPurple, width: 1),
                elevation: 5),
            child: Text('Save',
                style: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Define.strongPurple,
                )))
      ],
    );
  }
}
