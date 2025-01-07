import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';

class FindBar extends StatefulWidget{
  const FindBar({super.key});

  @override
  State<StatefulWidget> createState() => _FindBarState();
}

class _FindBarState extends State<FindBar>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 45,
      child: TextField(
        cursorColor: Define.strongPurple,
        cursorWidth: 2,
        style: const TextStyle(color: Define.strongPurple, fontSize: 18),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
            color: Define.strongPurple,
            size: 35,
          ),
          iconColor: Define.strongPurple,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Define.strongPurple, width: 2),
              borderRadius: BorderRadius.circular(30)),

        ),
      ),
    );
  }
}
