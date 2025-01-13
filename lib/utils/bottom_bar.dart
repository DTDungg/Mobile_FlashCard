import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:mobile_flash_card/controller/user_controller.dart';
import 'package:mobile_flash_card/screen/profile_screen.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

import '../screen/community_screen.dart';
import '../screen/home_screen.dart';
import '../screen/library_screen.dart';
import '../screen/game_screen.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  const BottomBar({super.key, required this.selectedIndex});

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 2;
  UserIDController userID = Get.put(UserIDController());

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    print("heloooooooooooooooooooooooooooooooooooo: tu api:${userID.userID.value}, tu controller: ${userID.userID.value}");

  }

  List<Widget> getScreens() {
    return [
      Center(child: GameScreen()),
      Center(child: LibraryScreen()),
      Center(child: HomeScreen()),
      Center(child: CommunityScreen()),
      Center(child: ProfileScreen()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getScreens()[_selectedIndex],
        extendBody: true,
        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Define.strongPurple,
          backgroundColor: Define.strongBlue.withOpacity(0.3),
          outlineBorderColor: Define.strongPurple,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.sports_esports,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
                icon: Icons.style, selectedColor: Colors.white),
            CrystalNavigationBarItem(
                icon: Icons.home, selectedColor: Colors.white),
            CrystalNavigationBarItem(
                icon: Icons.supervisor_account, selectedColor: Colors.white),
            CrystalNavigationBarItem(
                icon: Icons.person, selectedColor: Colors.white),
          ],
        ));
  }
}
