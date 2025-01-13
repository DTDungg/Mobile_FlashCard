import 'package:get/get.dart';
import 'package:mobile_flash_card/model/user_from_db.dart';
import 'package:mobile_flash_card/service/user_service.dart';

class UserIDController extends GetxController {
  RxInt userID = 2.obs;

  List<UserFromDB> users = [];

  Future<UserFromDB?> getUserById(int id) async {
    // Check if the user already exists in the list
    for (var item in users) {
      if (item.userID == id) {
        return item; // Return the existing user
      }
    }

    // If the user isn't found, fetch from the service
    try {
      final fetchedUser = await UserService().fetchUser(id);
      if (fetchedUser != null) {
        users.add(fetchedUser); // Add the fetched user to the list
      }
      return fetchedUser;
    } catch (e) {
      // Handle any errors during fetching
      print("Error fetching user: $e");
      return null;
    }
  }

}