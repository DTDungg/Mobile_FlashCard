import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/controller/search_controller.dart';
import 'package:mobile_flash_card/model/card.dart';
import 'package:mobile_flash_card/model/deck.dart';
import 'package:mobile_flash_card/screen/add_card_screen.dart';
import 'package:mobile_flash_card/screen/library_screen.dart';
import 'package:mobile_flash_card/screen/review_screen.dart';
import 'package:mobile_flash_card/service/card_service.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/card_widget.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:get/get.dart';

import '../controller/edit_deck_controller.dart';
import '../model/card_from_db.dart';

class CardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardScreenState();

  final Deck deck;

  const CardScreen({super.key, required this.deck});
}

class _CardScreenState extends State<CardScreen> {
  late Future<List<CardFromDB>> futureCard;
  EditCardController listDelete = Get.put(EditCardController());
  SearchXController searchXController = Get.put(SearchXController());
  late Future<List<CardFromDB>> cards ;

  @override
  void initState() {
    super.initState();
    futureCard = cards = CardService().fetchAllCardOfDeck(widget.deck.id);
  }

  void _updateCards() {
    setState(() {
      futureCard = CardService().fetchAllCardOfDeck(widget.deck.id);
    });
  }

  void _goToReview() async {
    try {
      final cards = await futureCard; // Chờ dữ liệu hoàn tất
      Get.to(ReviewScreen(
        cards: cards,
        id: widget.deck.id.toString(),
        name: widget.deck.name,
      ));
    } catch (error) {
      //print('Error fetching cards for review: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không thể lấy dữ liệu để review.')),
      );
    }
  }

  Future<void> search() async {
    String text = searchXController.card.trim().toLowerCase();
    if (text.isEmpty) {
      setState(() {
        futureCard = cards;
      });
    } else {
      // Giải quyết `decks` và lọc kết quả tìm kiếm
      final resolvedCards = await cards;
      setState(() {
        futureCard = Future.value(
          resolvedCards.where((card) => card.front!.toLowerCase().contains(text)).toList(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                IconButton(
                    onPressed: () {
                      Get.off(BottomBar(
                          selectedIndex: 1));
                    },
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Define.strongPurple, size: 30)),
                SizedBox(
                    width: 280,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "${widget.deck.fortmatID()}: ${widget.deck.name}",
                      style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Define.strongPurple),
                    )),
                Icon(
                  widget.deck.isPublic ? Icons.public : Icons.lock,
                  color: Define.strongPurple,
                  size: 30,
                )
              ],
            ),
            FindBar(update: search, index: 2),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      listDelete.deleteListItem();
                      _updateCards();
                    },
                    child: const BlueButton(content: 'Delete', w: 100)),
                const SizedBox(
                  width: 10,
                ),
                const BlueButton(content: 'Add to', w: 100),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: _goToReview,
                    child: const BlueButton(
                      content: 'Review',
                      w: 100,
                    )),
                const SizedBox(
                  width: 5,
                ),
                //const BlueButton(content: 'Sort', w: 73)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: 330,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Define.strongPurple, width: 2)),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: Define.strongPurple,
                  onPressed: () {
                    Get.to(AddCardScreen(deck: widget.deck));
                    setState(() {
                      futureCard =
                          CardService().fetchAllCardOfDeck(widget.deck.userID);
                    });
                  },
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 330,
                height: 620,
                child: FutureBuilder(
                    future: futureCard,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Lỗi : ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<CardFromDB> cards = snapshot.data!;
                        if (cards.isEmpty) {
                          return const Center(
                            child: Text(
                              "No card found",
                              style: TextStyle(color: Define.strongPurple),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              CardFromDB cardItem = cards[index];
                              return CardWidget(
                                card: cardItem,
                                edit: _updateCards,
                              );
                            });
                      } else {
                        return const Text('No data available');
                      }
                    }))
          ],
        ),
      ),
      extendBody: true,
    );
  }
}
