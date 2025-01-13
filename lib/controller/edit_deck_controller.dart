import 'package:get/get.dart';
import 'package:mobile_flash_card/service/card_service.dart';
class EditCardController extends GetxController {
  List<RxInt> deleteList= [];

  void addItem(int id){
    deleteList.add(id.obs);
  }

  bool checkItem(int id){
    return deleteList.contains(id);
  }

  void deleteItem(int id){
    if(checkItem(id))
      deleteList.remove(id);
  }

  bool isEmpty(){
    return deleteList.length == 0;
  }

  void deleteListItem() {
    if (!isEmpty()) {
      for (var item in deleteList) {
        CardService().DeleteCard(item.value); // Xóa thẻ
      }
      deleteList.clear(); // Xóa danh sách sau khi thực hiện
    }
  }
}

