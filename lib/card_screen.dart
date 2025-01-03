import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/utils/find_bar.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';

class CardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardScreenState();

  final String idName;
  final bool isPublic;

  const CardScreen({super.key, required this.idName, required this.isPublic});
}

class _CardScreenState extends State<CardScreen> {
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
              children: [
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                    width: 310,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      widget.idName,
                      style: GoogleFonts.rubikBubbles(
                          fontWeight: FontWeight.w400,
                          fontSize: 32,
                          color: Define.strongPurple),
                    )),
                Icon(
                  widget.isPublic ? Icons.public : Icons.lock,
                  color: Define.strongPurple,
                )
              ],
            ),
            FindBar(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 2,
                ),
                BlueButton(
                  content: 'Delete',
                ),
                SizedBox(
                  width: 1,
                ),
                BlueButton(content: 'Add to'),
                SizedBox(
                  width: 1,
                ),
                BlueButton(content: 'Review'),
                SizedBox(
                  width: 1,
                ),
                BlueButton(content: 'Sort')
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
                child: const IconButton(
                  icon: Icon(Icons.add),
                  color: Define.strongPurple,
                  onPressed: Define.nothing,
                )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
    );
  }
}
