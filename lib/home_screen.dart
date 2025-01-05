import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/colum.dart';
import 'package:mobile_flash_card/utils/define.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _nothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      appBar: AppBar(
        backgroundColor: Define.strongBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.local_fire_department),
            color: Define.strongPurple,
            onPressed: _nothing,
          ),
          Text(
            '100',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: _nothing,
            icon: const Icon(Icons.favorite),
            color: Define.strongPurple,
          ),
          Text(
            '10',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.visibility),
            color: Define.strongPurple,
            onPressed: _nothing,
          ),
          Text(
            '10',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: _nothing,
                  icon: const Icon(Icons.circle_notifications, size: 40),
                  color: Define.strongPurple,
                  padding: EdgeInsets.zero,
                ),
              )),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 40,
              height: 40,
              child: const Image(image: AssetImage('assets/images/fc.png')),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Define.strongPurple, width: 1),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Colum(
                        height: 150,
                        color: Define.strongBlue,
                        icon: Icon(Icons.sentiment_very_satisfied)),
                    SizedBox(width: 10),
                    Colum(
                        height: 80,
                        color: Define.lightBlue,
                        icon: Icon(Icons.sentiment_satisfied)),
                    SizedBox(width: 10),
                    Colum(
                        height: 100,
                        color: Define.lightPurple,
                        icon: Icon(Icons.sentiment_neutral)),
                    SizedBox(width: 10),
                    Colum(
                        height: 20,
                        color: Define.strongBlue,
                        icon: Icon(Icons.sentiment_very_dissatisfied))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Define.strongPurple, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have 20 cards need to be reviewed !!!',
                        style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Define.strongPurple,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _nothing,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Define.lightPurple,
                          side:
                             const BorderSide(color: Define.strongPurple, width: 1),
                          elevation: 5),
                      child: Text(
                        'Start now!!',
                        style: GoogleFonts.rubikBubbles(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 100)
        ],
      )),
      extendBody: true,
      bottomNavigationBar: const BottomBar(index: 2),
    );
  }
}
