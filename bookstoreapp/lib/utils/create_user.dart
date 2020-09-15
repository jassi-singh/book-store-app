import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserCreate {
  String email;
  String password;

  UserCreate({@required this.email, @required this.password});
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
