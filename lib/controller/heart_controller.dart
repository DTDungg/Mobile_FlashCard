import 'package:get/get.dart';

class HeartController extends GetxController{
  RxInt heart = 5.obs;

  void minus(){
    heart--;
  }

  void addHeart(){
    heart += 5;
  }
}