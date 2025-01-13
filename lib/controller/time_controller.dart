import 'dart:async';
import 'package:get/get.dart';
import 'package:mobile_flash_card/screen/game_result_screen.dart';

class TimeController extends GetxController {
  var remainingTime = 120.obs; // Observable thời gian còn lại
  var initialTime = 120.obs;   // Observable thời gian ban đầu
  var isRunning = false.obs;  // Observable trạng thái bộ đếm
  Timer? _timer;

  void startTimer() {
    if (_timer != null || remainingTime.value == 0) return;
    isRunning.value = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (remainingTime.value > 0) {
          remainingTime.value--;
        } else {
          _timer?.cancel();
          _timer = null;
          //remainingTime.value = initialTime.value; // Reset
          isRunning.value = false;
          Get.off(GameResult(isWin: false));
        }
      },
    );
  }

  void pauseTimer() {
    _timer?.cancel();
    _timer = null;
    isRunning.value = false;
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;
    remainingTime.value = initialTime.value;
    isRunning.value = false;

  }

  void setTime() {
    remainingTime.value += 30;
    initialTime.value +=30;
  }
}
