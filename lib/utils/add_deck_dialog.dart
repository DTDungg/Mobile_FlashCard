import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';


class AddDeckDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddDeckDialogState();
  }

class _AddDeckDialogState extends State<AddDeckDialog>{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController describeController = TextEditingController();
  TextEditingController isPublicController = TextEditingController();
  bool isPublic = true;

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
                child: Text('New Deck',
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
                    print("isPublic: $isPublic");
                  });
                },
                child: Icon(
                  isPublic ? Icons.public : Icons.lock,
                  color: Define.strongPurple,
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Define.lightBlue,
                labelText: 'Name',
                labelStyle: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Define.strongPurple,
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Define.strongPurple,
                        width: 2),
                    borderRadius:
                    BorderRadius.circular(30))),
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
                labelText: 'Describe',
                labelStyle: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Define.strongPurple,
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Define.strongPurple,
                        width: 2),
                    borderRadius:
                    BorderRadius.circular(30))),
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
            onPressed: () {
              // print('Name: ${nameController.text}');
              // print('Name: ${describeController.text}');
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Define.lightPurple,
                side: const BorderSide(
                    color: Define.strongPurple,
                    width: 1),
                elevation: 5),
            child: Text('Save',
                style: GoogleFonts.rubikBubbles(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Define.strongPurple,
                )))
      ],
    );

}}

