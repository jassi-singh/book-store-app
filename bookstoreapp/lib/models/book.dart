import 'dart:ffi';

class Book {
  int id;
  String name;
  String writer;
  int price;
  String image;
  bool favourite;
  bool cart;
  String details;

  Book(
      {this.id, this.name, this.writer, this.image,this.price, this.favourite, this.cart,this.details});
}
