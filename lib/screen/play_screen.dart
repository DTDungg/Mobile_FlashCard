import 'package:flutter/material.dart';
import 'package:mobile_flash_card/model/card_from_db.dart';
import 'package:mobile_flash_card/screen/game_result_screen.dart';
import 'package:mobile_flash_card/service/card_service.dart';
import 'package:mobile_flash_card/utils/app_bar_game.dart';
import 'package:mobile_flash_card/utils/define.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/heart_controller.dart';
import '../controller/time_controller.dart';

class PlayScreen extends StatefulWidget {

  final int deckID;
  PlayScreen({super.key, required this.deckID});

  @override
  State<StatefulWidget> createState() => PlayState();
}

class PlayState extends State<PlayScreen> {

  List<Map<String, String>> allPairs =[];

  bool isPlaying = true;
  bool isLoading = true;

  int? firstSelectedIndex;
  int? secondSelectedIndex;

  final TimeController timeController = Get.put(TimeController());
  final HeartController heartController = Get.put(HeartController());

  late List<String?> gridItems; // Lưới hiển thị từ và nghĩa
  List<int> selectedIndexes = []; // Các chỉ số ô đã chọn

  Future<void> _initializeCard() async {
    try {
      allPairs = await CardService().playCardByID(widget.deckID);

      setState(() {
        // Khởi tạo lưới khi đã có dữ liệu
        gridItems = List.filled(allPairs.length * 2, null);

        for (int i = 0; i < allPairs.length; i++) {
          gridItems[i * 2] = allPairs[i]["word"]; // Từ tiếng Anh
          gridItems[i * 2 + 1] = allPairs[i]["meaning"]; // Nghĩa tiếng Việt
        }

        gridItems.shuffle(); // Trộn ngẫu nhiên
        isLoading = false; // Đánh dấu là đã tải xong
      });
    } catch (e) {
      print("Error initializing card: $e");
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  void initState(){
    super.initState();
    _initializeCard();

    // Khởi tạo lưới với 20 ô trống
    // gridItems = List.filled(18, null);

    // Thêm từ và nghĩa vào lưới
    // for (int i = 0; i < allPairs.length; i++) {
    //   gridItems[i * 2] = allPairs[i]["word"]; // Từ tiếng Anh
    //   gridItems[i * 2 + 1] = allPairs[i]["meaning"]; // Nghĩa tiếng Việt
    // }

    // Trộn ngẫu nhiên danh sách
    // gridItems.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator()); // Hiển thị biểu tượng loading
    }
    timeController.startTimer();
    return Scaffold(
      backgroundColor: Define.lightBlue,
      body: SingleChildScrollView(
        child: Column(children: [
          AppBarGame(
              isGaming: true,
              heartController: heartController,
              timeController: timeController),
          const SizedBox(height: 30),
          SizedBox(
            width: 370,
            height: 750,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: gridItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => handleTap(index),
                  child: Container(
                    padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: gridItems[index] == null
                              ? Define.lightBlue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: gridItems[index] == null
                                  ? Define.lightBlue
                                  : selectedIndexes.contains(index)
                                      ? Colors.green
                                      : Define.strongPurple,
                              width: 2)),
                      child: Center(
                        child: Text(
                          gridItems[index] ?? "",
                          style: GoogleFonts.nunito(
                              color: Define.strongPurple,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      )),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  void handleTap(int index) {
    // Nếu ô đã chọn không có giá trị, thoát
    if (gridItems[index] == null) return;

    setState(() {
      selectedIndexes.add(index);

      // Nếu đã chọn đủ 2 ô
      if (selectedIndexes.length == 2) {
        int firstIndex = selectedIndexes[0];
        int secondIndex = selectedIndexes[1];

        // Nếu cặp đúng (từ và nghĩa khớp)
        if (_isMatchingPair(firstIndex, secondIndex)) {
          gridItems[firstIndex] = null; // Xóa từ
          gridItems[secondIndex] = null; // Xóa nghĩa

          // Kiểm tra nếu tất cả ô đã được ghép thành công
          if (gridItems.every((item) => item == null)) {
            Get.off(GameResult(isWin: true)); // Chuyển sang màn hình chiến thắng
          }
        } else {
          // Nếu cặp không đúng, trừ điểm
          heartController.minus();
          if (heartController.heart.value == 0) {
            Get.off(GameResult(isWin: false)); // Chuyển sang màn hình thua
          }
        }

        // Đặt lại chỉ số chọn sau 1 giây
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            selectedIndexes.clear();
          });
        });
      }
    });
  }


  bool _isMatchingPair(int index1, int index2) {
    String? value1 = gridItems[index1];
    String? value2 = gridItems[index2];

    if (value1 == null || value2 == null) return false;

    // Kiểm tra nếu cặp đúng
    for (var pair in allPairs) {
      if ((pair["word"] == value1 && pair["meaning"] == value2) ||
          (pair["word"] == value2 && pair["meaning"] == value1)) {
        return true;
      }
    }
    return false;
  }
}
