import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:get/get.dart';
import 'package:mobile_flash_card/utils/edit_deck_dialog.dart';

import '../screen/card_screen.dart';
import 'add_deck_dialog.dart';

class DeckWidget extends StatefulWidget {
  final Deck deck;
  final Function onDelete;
  final VoidCallback edit;


  const DeckWidget({super.key, required this.deck, required this.onDelete, required this.edit});

  @override
  State<StatefulWidget> createState() => _DeckState();
}

class _DeckState extends State<DeckWidget> {
  void _goToDeckDetail() {
    Get.to(CardScreen(deck: widget.deck));
  }



  //EditDeckController nameEdit = Get.put(EditDeckController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 330,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Define.strongPurple, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: _goToDeckDetail,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "${widget.deck.fortmatID()}: ${widget.deck.name}",
                            style: GoogleFonts.rubikBubbles(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Define.strongPurple),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        widget.deck.isPublic ? Icons.public : Icons.lock,
                        color: Define.strongPurple,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () async {
                            try {
                              await DeckService().deleteDeck(widget.deck.id);
                              widget.onDelete();
                              Get.snackbar('Thành công', 'Bộ thẻ đã được xóa',
                                  backgroundColor: Define.lightPurple,
                                  colorText: Colors.white);
                            } catch (e) {
                              Get.snackbar('Lỗi', 'Không thể xóa bộ thẻ',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Define.strongPurple,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return EditDeckDialog(
                                      userID: widget.deck.userID,
                                      name: widget.deck.name,
                                      description: widget.deck.description,
                                      setID: widget.deck.id,
                                      edit: widget.edit,
                                    isPublic: widget.deck.isPublic,
                                  );
                                });

                          },
                          icon: Icon(Icons.draw, color: Define.strongPurple))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.deck.description,
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
