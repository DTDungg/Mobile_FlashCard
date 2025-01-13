import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:mobile_flash_card/screen/signin_screen.dart';
import 'package:mobile_flash_card/service/user_service.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  UserIDController userID = Get.put(UserIDController());
  late Future<UserFromDB> user;

  @override
  void initState() {
    super.initState();
    user = UserService().fetchUser(userID.userID.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      extendBody: true,
      body: SingleChildScrollView(
        child: FutureBuilder<UserFromDB>(
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
                        onPressed:(){ Get.off(SignInScreen());},
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
              );


            } else {
              return const Text('No data available');
            }
          }


        ),
      ),
    );
  }
}