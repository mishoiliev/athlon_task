import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool userLoggedIn;
  int id;

  void setUserLoggedIn(bool userLoggedIn, int id) {
    this.userLoggedIn = userLoggedIn;
    this.id = id;

    notifyListeners();
  }
}
