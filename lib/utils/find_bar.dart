import 'package:flutter/material.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';

import '../controller/search_controller.dart';

class FindBar extends StatefulWidget{
  final VoidCallback update;
  final int index;

  const FindBar({super.key, required this.update, required this.index});


  @override
  State<StatefulWidget> createState() => _FindBarState();
}

class _FindBarState extends State<FindBar>{
  SearchXController searchController = Get.put(SearchXController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 45,
      child: TextField(
        onChanged: (text){
          if(widget.index == 1){
            searchController.library= text;
          }else if(widget.index == 2){
            searchController.card = text;
          }else{
            searchController.community = text;
          }
          widget.update();
        },
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
