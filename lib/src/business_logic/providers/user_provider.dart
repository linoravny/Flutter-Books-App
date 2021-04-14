import 'package:books_app/src/business_logic/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  //with is mixin.
  User _usr;

  User get userData {
    return _usr;
  }

  bool get isAuth {
    return _usr.isAuth;
  }

  void setUserData(User usrData) {
    _usr = usrData;
    notifyListeners();
  }
}
