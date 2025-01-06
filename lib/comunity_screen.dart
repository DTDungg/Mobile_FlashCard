import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/famous_set.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';
import 'package:mobile_flash_card/utils/user_rank.dart';

import 'model/deck.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'LeaderBoard',
                textAlign: TextAlign.start,
                style: GoogleFonts.rubikBubbles(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Define.strongPurple),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                height: 240,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  children: const [
                    UserRank(
                        userColor: Define.lightBlue,
                        rank: 1,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris',
                        gift: 2025),
                    UserRank(
                        userColor: Define.lightBlue,
                        rank: 2,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris a a a a a a a a a',
                        gift: 202),
                    UserRank(
                        userColor: Define.lightBlue,
                        rank: 3,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris',
                        gift: 20),
                    UserRank(
                        userColor: Colors.white,
                        rank: 4,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris',
                        gift: 2),
                    UserRank(
                        userColor: Colors.white,
                        rank: 5,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris',
                        gift: 20250),
                    UserRank(
                        userColor: Colors.white,
                        rank: 11,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris a a a a a a',
                        gift: 20200005),
                    UserRank(
                        userColor: Colors.white,
                        rank: 10,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris',
                        gift: 2025),
                    UserRank(
                        userColor: Colors.white,
                        rank: 55,
                        avatar: 'assets/images/fc.png',
                        name: 'Doris a a a a a',
                        gift: 2025000000),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Famous set',
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Define.strongPurple),
              ),
              const SizedBox(height: 5),
              FindBar(),
              const SizedBox(height: 10),
              Container(
                width: 345,
                height: 435,
                child: ListView(
                  padding: EdgeInsets.only(top: 5, bottom: 100),
                  children: [
                    FamousSet(
                        deck: Deck(
                            id: 001,
                            name: 'Cooking',
                            isPublic: true,
                            description: 'cooking, kitchen and related things',
                            like: 30,
                            userID: 1)),
                    FamousSet(
                        deck: Deck(
                            id: 002,
                            name: 'Cooking',
                            isPublic: true,
                            description: 'cooking, kitchen and related things',
                            like: 28,
                            userID: 1)),
                    FamousSet(
                        deck: Deck(
                            id: 010,
                            name: 'Cooking a a a a a a a a a a a a',
                            isPublic: true,
                            description:
                                'cooking, kitchen and related things a a a a a a a a a a a a a ',
                            like: 20,
                            userID: 1)),
                    FamousSet(
                        deck: Deck(
                            id: 055,
                            name: 'Cooking',
                            isPublic: true,
                            description: 'cooking, kitchen and related things',
                            like: 10,
                            userID: 1)),
                    FamousSet(
                        deck: Deck(
                            id: 000,
                            name: 'Cooking',
                            isPublic: true,
                            description: 'cooking, kitchen and related things',
                            like: 50,
                            userID: 1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(index: 3),
    );
  }
}
