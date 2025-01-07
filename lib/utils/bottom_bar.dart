import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

import '../screen/community_screen.dart';
import '../screen/home_screen.dart';
import '../screen/library_screen.dart';

class BottomBar extends StatefulWidget{
  final int index;
  const BottomBar({super.key, required this.index});

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State <BottomBar> {

  final List<Widget> screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const HomeScreen(),
    const CommunityScreen(),
    const HomeScreen(),
  ];

  void _handleIndexChanged(int index) {
    Get.off(screens[index]);
  }


  @override
  Widget build(BuildContext context) {
    return CrystalNavigationBar(
        currentIndex: widget.index,
        unselectedItemColor: Define.strongPurple,
        backgroundColor: Define.strongBlue.withOpacity(0.3),
        outlineBorderColor: Define.strongPurple,
        onTap: _handleIndexChanged,
        items: [
          CrystalNavigationBarItem(
            icon: Icons.sports_esports,
            selectedColor: Colors.white,
          ),
          CrystalNavigationBarItem(
              icon: Icons.style,
              selectedColor: Colors.white
          ),
          CrystalNavigationBarItem(
              icon: Icons.home,
              selectedColor: Colors.white
          ),
          CrystalNavigationBarItem(
              icon: Icons.supervisor_account,
              selectedColor: Colors.white
          ),
          CrystalNavigationBarItem(
              icon: Icons.person,
              selectedColor: Colors.white
          ),
        ],
    );
  }



}