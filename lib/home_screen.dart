import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            icon: Icon(Icons.local_fire_department),
            color: Define.strongPurple,
            onPressed: _nothing,
          ),
          Text(
            '100',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: _nothing,
            icon: Icon(Icons.favorite),
            color: Define.strongPurple,
          ),
          Text(
            '10',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.visibility),
            color: Define.strongPurple,
            onPressed: _nothing,
          ),
          Text(
            '10',
            style: GoogleFonts.rubikBubbles(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(width: 20),
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
                  icon: Icon(Icons.circle_notifications, size: 40),
                  color: Define.strongPurple,
                  padding: EdgeInsets.zero,
                ),
              )),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 40,
              height: 40,
              child: Image(
                  image: AssetImage('assets/images/fc.png')
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
