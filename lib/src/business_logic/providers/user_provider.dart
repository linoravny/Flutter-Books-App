import 'package:books_app/src/business_logic/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  //with is mixin.
  User _usr;

  User get userData {
    return _usr;
  }

  bool get isAuth {
    return _usr.isAuth;
  }

  PickedFile get getAvatar {
    if (_usr != null && _usr.avatar != null) {
      return _usr.avatar;
    }
    return null;
  }

  void setUserData(User usrData) {
    _usr = usrData;
    notifyListeners();
  }

  void setUserAvatar(PickedFile avatarImg) {
    _usr.avatar = avatarImg;
  }
}
