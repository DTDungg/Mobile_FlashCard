import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../model/deck.dart';
import '../model/deck_from_db.dart';
import '../model/user_from_db.dart';
import '../service/deck_service.dart';
import '../service/user_service.dart';
import '../utils/famous_set.dart';

class OtherUserScreen extends StatefulWidget{
  final int otherUserId;

  const OtherUserScreen({super.key, required this.otherUserId});
  @override
  State<StatefulWidget> createState() => _OtherUserScreenState();

}

class _OtherUserScreenState extends State<OtherUserScreen>{

  late Future<List<DeckFromDb>> futureDeck;
  UserIDController userID = Get.put(UserIDController());
  late Future<UserFromDB> user;

  @override
  void initState() {
    super.initState();
    futureDeck = DeckService().deckOfOtherUser(widget.otherUserId);
    user = UserService().fetchUser(widget.otherUserId);
  }

  void upDateScreen() {
    setState(() {
      futureDeck = DeckService().getFamousSet(userID.userID.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<UserFromDB>(
                future: user,
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Lỗi : ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    UserFromDB u = snapshot.data!;
                    if (u == null) {
                      return const Center(
                        child: Text(
                          "No user found",
                          style: TextStyle(color: Define.strongPurple),
                        ),
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${u.userName}',
                                style: GoogleFonts.rubikBubbles(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w400,
                                    color: Define.strongPurple)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //AssetImage('${user.avatar}
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Define.strongPurple, width: 2)
                                  ),
                                  child: const Image(
                                      image: AssetImage('assets/images/fc.png'))),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${u.streak}',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongPurple),
                                      ),
                                      Text(
                                        ' Days',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongBlue),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${u.follower}',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongPurple),
                                      ),
                                      Text(
                                        ' Follower',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongBlue),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${u.following}',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongPurple),
                                      ),
                                      Text(
                                        ' Following',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongBlue),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${u.gift}',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongPurple),
                                      ),
                                      Text(
                                        ' Gifts',
                                        style: GoogleFonts.rubikBubbles(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w400,
                                            color: Define.strongBlue),
                                      ),
                                    ],
                                  )
                                ]),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Define.strongPurple, width: 2),
                                  elevation: 5),
                              onPressed:Define.nothing,
                              child: SizedBox(
                                width: 110,
                                child: Row(
                                  children: [
                                    Text(
                                      'Follow!!',
                                      style: GoogleFonts.rubikBubbles(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: Define.strongPurple),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ],
                    );
                  } else {
                    return const Text('No data available');
                  }
                }
            ),
            SizedBox(height: 20,),
            Container(
              width: 345,
              height: 530,
              child: FutureBuilder(
                  future: futureDeck,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Lỗi : ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<DeckFromDb> decks = snapshot.data!;
                      if (decks.isEmpty) {
                        return const Center(
                          child: Text(
                            "have no deck",
                            style: TextStyle(color: Define.strongPurple),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: decks.length,
                          itemBuilder: (context, index) {
                            DeckFromDb deck = decks[index];
                            return FamousSet(
                              deck: Deck(
                                  id: deck.setId!,
                                  name: deck.setName!,
                                  isPublic: deck.isPublic!,
                                  description: deck.setDescription!,
                                  like: deck.liked!,
                                  userID: deck.userId!),
                              like: upDateScreen,
                            );
                          });
                    } else {
                      return const Text('No data available');
                    }
                  })
              ,
            ),
          ],
        ),
      ),
    );
  }

}