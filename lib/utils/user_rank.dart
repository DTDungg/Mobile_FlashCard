import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';

class UserRank extends StatelessWidget {
  final Color userColor;
  final int rank;
  final String avatar;
  final String name;
  final int gift;

  const UserRank(
      {super.key,
      required this.userColor,
      required this.rank,
      required this.avatar,
      required this.name,
      required this.gift});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            color: userColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Define.strongPurple, width: 1)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 35,
                child: Text(
                  rank.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rubikBubbles(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Define.strongPurple),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image(image: AssetImage(avatar)),
            ),
            SizedBox(
              width: 110,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubikBubbles(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Define.strongPurple),
              ),
            ),
            const SizedBox(width: 5,),
            SizedBox(
                width: 90,
                child: Align(
                  alignment: Alignment.centerRight,
                    child: Text(
                  gift.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rubikBubbles(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Define.strongPurple),
                ))),
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [Define.strongBlue, Define.strongPurple],
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.card_giftcard,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
