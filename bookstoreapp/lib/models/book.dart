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

      factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      writer: json['writer'],
      cart: json['cart'],
      favourite: json['favourite'],
      price: json['price'],
      details: json['details'],
      image: json['image'],
    );
  }
}
