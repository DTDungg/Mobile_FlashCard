import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/model/deck_from_client.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

import '../controller/edit_deck_controller.dart';

class EditDeckDialog extends StatefulWidget {
  final int userID;
  final String name;
  final String description;
  final int setID;
  final bool isPublic;
  final VoidCallback edit;


  const EditDeckDialog({super.key, required this.userID, required this.name, required this.description, required this.setID,required this.isPublic, required this.edit});
  @override
  State<StatefulWidget> createState() => _EditDeckDialogState();
}

class _EditDeckDialogState extends State<EditDeckDialog> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController describeController = TextEditingController();
  bool isPublic = true;

  @override
  void initState() {
    super.initState();
    isPublic = widget.isPublic;
  }

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
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPublic = !isPublic;
                  });
                },
                child: Icon(
                  isPublic ? Icons.public : Icons.lock,
                  color: Define.strongPurple,
                ),
              )
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
                hintText: widget.name,
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
                hintText: widget.description,
                labelText: 'Describe',
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
                await DeckService().updateNewDeck(widget.setID,DeckFromClient(
                    setName: nameController.text,
                    setDescription: describeController.text,
                    isPublic: isPublic,
                    userId: widget.userID));
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
