import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/controller/edit_deck_controller.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';
import 'package:mobile_flash_card/utils/edit_card_dialog.dart';

class CardWidget extends StatefulWidget {
  final CardFromDB card;
  final VoidCallback edit;

  const CardWidget({super.key, required this.card, required this.edit});

  @override
  State<StatefulWidget> createState() => CardWidgetState();
}

class CardWidgetState extends State<CardWidget> {
  bool _isChecked = false;

  EditCardController listDelete = Get.put(EditCardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 330,
        decoration: BoxDecoration(
            color: _isChecked ? Define.lightPurple : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Define.strongPurple, width: 1)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                      if (_isChecked == true) {
                        listDelete.addItem(widget.card.cardId!);
                      } else {
                        listDelete.deleteItem(widget.card.cardId!);
                      }
                    },
                    child: Icon(
                      _isChecked
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Define.strongPurple,
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    widget.card.front!,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.rubikBubbles(
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                        color: Define.strongPurple),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return EditCardDialog(
                                card: widget.card, edit: widget.edit);
                          });
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Define.strongPurple,
                      size: 25,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    widget.card.type == 1
                        ? Icons.sentiment_very_dissatisfied
                        : widget.card.type == 2
                            ? Icons.sentiment_neutral
                            : widget.card.type == 3
                                ? Icons.sentiment_satisfied
                                : Icons.sentiment_very_satisfied,
                    color: Define.strongPurple,
                  ),
                )
              ],
            ),
            const Text(
              '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _',
              style: TextStyle(color: Define.strongPurple),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                overflow: TextOverflow.ellipsis,
                widget.card.back!,
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Define.strongPurple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                widget.card.description ?? "",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Define.strongPurple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
