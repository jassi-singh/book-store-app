import 'package:flutter/cupertino.dart';

class BookManipulation {
  bool cart;

  BookManipulation({@required this.cart});
  Map<String, dynamic> toJson() {
    return {"cart": cart};
  }
}
