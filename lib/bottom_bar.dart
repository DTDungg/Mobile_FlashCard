import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:mobile_flash_card/library_screen.dart';

import 'home_screen.dart';


class BottomBar extends StatefulWidget{
  const BottomBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State <BottomBar> {

  int _selectedIndex = 2;

  void _handleIndexChanged(int p1) {
    setState(() {
      _selectedIndex = p1;
    });
  }

  final List<Widget> screens = [
    Center(child: HomeScreen()),
    Center(child: LibraryScreen()),
    Center(child: HomeScreen()),
    Center(child: HomeScreen()),
    Center(child: HomeScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _selectedIndex,
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
      ),
    );
  }



}