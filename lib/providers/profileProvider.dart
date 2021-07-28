import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  String email;
  String password;
  Image profileImage;
  DateTime dateCreated;

  //when a user logs in, we set the user info to display
  void setUserLoggedIn(
      String email, String password, Image profileImage, DateTime dateCreated) {
    this.email = email;
    this.password = password;
    this.profileImage = profileImage;
    this.dateCreated = dateCreated;

    notifyListeners();
  }
}
