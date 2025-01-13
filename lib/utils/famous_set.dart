import 'package:flutter/material.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/model/save_from_client.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:mobile_flash_card/screen/card_screen.dart';
import 'package:mobile_flash_card/screen/orther_user_screen.dart';
import 'package:mobile_flash_card/service/deck_service.dart';
import 'package:mobile_flash_card/service/save_service.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';


import '../model/deck.dart';

class FamousSet extends StatefulWidget {
  final Deck deck;
  final VoidCallback like;

  const FamousSet({super.key, required this.deck, required this.like});

  @override
  State<StatefulWidget> createState() => _SetState();
}

class _SetState extends State<FamousSet> {
  UserIDController userIDController = Get.put(UserIDController());

  UserFromDB u = UserFromDB();
  UserIDController lU = Get.put(UserIDController());

  int like = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeUser();
    like = widget.deck.like;
  }

  Future<void> _initializeUser() async {
    try {
      u = await lU.getUserById(widget.deck.userID) ?? UserFromDB();
    } catch (e) {
      print("Error initializing user: $e");
    } finally {
      setState(() {
        isLoading = false; // Đánh dấu là đã tải xong
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator()); // Hiển thị biểu tượng loading
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Define.strongPurple, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: 270,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(CardScreen(deck: widget.deck));
                        },
                        child: Text(
                          '${widget.deck.fortmatID()}: ${widget.deck.name}',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.rubikBubbles(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Define.strongPurple),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){Get.to(OtherUserScreen(otherUserId: u.userID!));},
                      child: Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 1, color: Define.strongPurple)),
                              child: Image(image: AssetImage(u.avatar!))),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              u.userName!,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Define.strongPurple),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Text(
                        widget.deck.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.rubik(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          like.toString(),
                          style: GoogleFonts.rubikBubbles(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Define.strongPurple),
                        ),
                        const Icon(Icons.favorite, color: Define.strongPurple)
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ElevatedButton(
                        onPressed:(){
                          SaveService().CreateSave(SaveFromClient(userId: userIDController.userID.value, setId: widget.deck.id));
                          DeckService().increaseLike(widget.deck.id);
                          widget.like;
                          setState(() {
                            like ++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                            padding: const EdgeInsets.only(left: 0),
                            backgroundColor: Define.lightPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                                color: Define.strongPurple, width: 1)),
                        child: const Icon(
                          Icons.add,
                          color: Define.strongPurple,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
