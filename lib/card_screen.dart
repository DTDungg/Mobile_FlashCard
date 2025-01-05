import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/model/card.dart';
import 'package:mobile_flash_card/utils/blue_button.dart';
import 'package:mobile_flash_card/utils/card_widget.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                BlueButton(content: 'Delete', w: 84),
                SizedBox(
                  width: 5,
                ),
                BlueButton(content: 'Add to',w: 83),
                SizedBox(
                  width: 5,
                ),
                BlueButton(content: 'Review',w: 87),
                SizedBox(
                  width: 5,
                ),
                BlueButton(content: 'Sort',w: 73)
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 330,
                height: 620,
                child: ListView(children: [
                  CardWidget(
                      card: CustomCard(
                          id: 1,
                          front: 'spoon a a a a a a a a a',
                          back: 'cái muỗng a a a â a  a  a  â  a a â a',
                          describe: 'a thing use to hold food a a a a a aa a a a a a a a a a a a a a a a a a a a a',
                          type: 1)),
                  CardWidget(
                      card: CustomCard(
                          id: 2,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 2)),
                  CardWidget(
                      card: CustomCard(
                          id: 3,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: '',
                          type: 3)),
                  CardWidget(
                      card: CustomCard(
                          id: 1,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food a a a a a aa a a a a a a a a a a a a a a a a a a a a',
                          type: 4)),
                  CardWidget(
                      card: CustomCard(
                          id: 2,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 4)),
                  CardWidget(
                      card: CustomCard(
                          id: 3,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 2)),
                  CardWidget(
                      card: CustomCard(
                          id: 1,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 3)),
                  CardWidget(
                      card: CustomCard(
                          id: 2,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 1)),
                  CardWidget(
                      card: CustomCard(
                          id: 3,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 4)),
                  CardWidget(
                      card: CustomCard(
                          id: 1,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 4)),
                  CardWidget(
                      card: CustomCard(
                          id: 2,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 4)),
                  CardWidget(
                      card: CustomCard(
                          id: 3,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 3)),
                  CardWidget(
                      card: CustomCard(
                          id: 1,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 1)),
                  CardWidget(
                      card: CustomCard(
                          id: 2,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 2)),
                  CardWidget(
                      card: CustomCard(
                          id: 3,
                          front: 'spoon',
                          back: 'cái muỗng',
                          describe: 'a thing use to hold food',
                          type: 4)),
                ]))
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(index: 1),
    );
  }
}
