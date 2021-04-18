import 'package:image_picker/image_picker.dart';

class User {
  final int id;
  final String password;
  final String email;
  final int phone;
  final String name;
  bool isAuth;
  PickedFile avatar;

  User({
    this.id,
    this.password,
    this.email,
    this.phone,
    this.name,
    this.isAuth,
    this.avatar,
  });
}
