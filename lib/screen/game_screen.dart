import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';

class GameScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomBar(index: 0),
    );
  }
}