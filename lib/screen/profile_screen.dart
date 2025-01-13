import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/utils/define.dart';

class ProfileScreen extends StatefulWidget {
  final int userID;
  const ProfileScreen({super.key, required this.userID});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Doris',
                    style: GoogleFonts.rubikBubbles(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                        color: Define.strongPurple)),
                const IconButton(
                    onPressed: Define.nothing,
                    icon: Icon(
                      Icons.edit,
                      color: Define.strongPurple,
                      size: 30,
                    ))
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
                        '123  ',
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                      Text(
                        'Days',
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
                        '5  ',
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                      Text(
                        'Follower',
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
                        '3  ',
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                      Text(
                        'Following',
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
                        '300  ',
                        style: GoogleFonts.rubikBubbles(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                            color: Define.strongPurple),
                      ),
                      Text(
                        'Gifts',
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
                  onPressed: Define.nothing,
                  child: SizedBox(
                    width: 135,
                    child: Row(
                      children: [
                        Text(
                          'Log Out',
                          style: GoogleFonts.rubikBubbles(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Define.strongPurple),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.logout, color: Define.strongPurple,)
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
