import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:mobile_flash_card/screen/review_screen.dart';
import 'package:mobile_flash_card/service/home_screen_service.dart';
import 'package:mobile_flash_card/service/user_service.dart';
import 'package:mobile_flash_card/utils/bottom_bar.dart';
import 'package:mobile_flash_card/utils/colum.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

import '../model/chart.dart';
import '../model/card_from_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userID});
  final int userID;

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _nothing() {}

  late Future<List<Chart>> futureChart;
  late Future<List<CardFromDB>> futureCard;
  late Future<UserFromDB> futureUser;

  @override
  void initState() {
    super.initState();
    futureChart = HomeScreenService().fetchAllChart(widget.userID);
    futureCard = HomeScreenService().fetchAllCard(widget.userID);
    futureUser = UserService().fetchUser(widget.userID);
    // setState(() {
    //   futureChart = HomeScreenService().fetchAllChart(widget.userID);
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureChart = HomeScreenService().fetchAllChart(widget.userID);
    futureCard = HomeScreenService().fetchAllCard(widget.userID);
    futureUser = UserService().fetchUser(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Define.lightBlue,
      appBar: AppBar(backgroundColor: Define.strongBlue, actions: [
        FutureBuilder<UserFromDB>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Lỗi : ${snapshot.error}');
              } else if (snapshot.hasData) {
                UserFromDB user = snapshot.data!;
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.local_fire_department),
                      color: Define.strongPurple,
                      onPressed: _nothing,
                    ),
                    Text(
                      '${user.streak}',
                      style: GoogleFonts.rubikBubbles(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: _nothing,
                      icon: const Icon(Icons.favorite),
                      color: Define.strongPurple,
                    ),
                    Text(
                      '${user.following}',
                      style: GoogleFonts.rubikBubbles(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.visibility),
                      color: Define.strongPurple,
                      onPressed: _nothing,
                    ),
                    Text(
                      '${user.follower}',
                      style: GoogleFonts.rubikBubbles(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                    Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: _nothing,
                            icon: const Icon(Icons.circle_notifications,
                                size: 40),
                            color: Define.strongPurple,
                            padding: EdgeInsets.zero,
                          ),
                        )),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image(image: AssetImage('${user.avatar}')),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                );
              } else {
                return const Text('nan demo nai');
              }
            })
      ]),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: FutureBuilder<List<Chart>>(
                    future: futureChart,
                    builder: (context, snapshot) {
                      //dữ liệu chưa về
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Lỗi : ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<Chart> charts = snapshot.data!;
                        var maxItem = charts.reduce((current, next) =>
                            current.amount! > next.amount! ? current : next);
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Colum(
                                max: maxItem.amount!,
                                height: charts[3].amount!.toDouble(),
                                color: Define.strongBlue,
                                icon:
                                    const Icon(Icons.sentiment_very_satisfied)),
                            const SizedBox(width: 10),
                            Colum(
                                max: maxItem.amount!,
                                height: charts[2].amount!.toDouble(),
                                color: Define.lightBlue,
                                icon: const Icon(Icons.sentiment_satisfied)),
                            const SizedBox(width: 10),
                            Colum(
                                max: maxItem.amount!,
                                height: charts[1].amount!.toDouble(),
                                color: Define.lightPurple,
                                icon: const Icon(Icons.sentiment_neutral)),
                            const SizedBox(width: 10),
                            Colum(
                                max: maxItem.amount!,
                                height: charts[0].amount!.toDouble(),
                                color: Define.strongBlue,
                                icon: const Icon(
                                    Icons.sentiment_very_dissatisfied))
                          ],
                        );
                      } else {
                        return const Text('No data available');
                      }
                    }),
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
                child: FutureBuilder(
                    future: futureCard,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if (snapshot.hasError) {
                        return Text('lỗi ${snapshot.error}');
                      } else if (snapshot.hasData && snapshot.data!=null) {

                        List<CardFromDB> cards = snapshot.data!;
                        int amount = cards.length;
                        for (var card in cards) {
                          print(
                              'Front: ${card.front}, Back: ${card.back}, Description: ${card.description}, SetID: ${card.setId}');
                        }
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                'You have $amount cards need to be reviewed !!!',
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
                              onPressed: amount == 0
                                  ? _goToLib
                                  : () => _gotoReview(cards),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Define.lightPurple,
                                  side: const BorderSide(
                                      color: Define.strongPurple, width: 1),
                                  elevation: 5),
                              child: Text(
                                amount == 0 ? 'Go to library! ' : 'Start now!!',
                                style: GoogleFonts.rubikBubbles(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Text('No cards available for review.');
                      }
                    }),
              ),
            ),
          ),
          const SizedBox(height: 100)
        ],
      )),
    );
  }

  void _goToLib() {
    Get.to(BottomBar(selectedIndex: 1, userID: widget.userID,));
  }

  void _gotoReview(List<CardFromDB> cards) async{
    final result = await Get.to(ReviewScreen(cards: cards, id: '', name: 'Card need to be review'));
    if (result == true) {
      setState(() {
        futureCard = HomeScreenService().fetchAllCard(widget.userID);
      });
    }
  }
}
