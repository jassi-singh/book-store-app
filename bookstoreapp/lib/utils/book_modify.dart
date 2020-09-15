class BookManipulation {
  bool cart;
  bool favourite;

  BookManipulation({this.cart, this.favourite});
  Map<String, dynamic> toJson() {
    return {"cart": cart, "favourite": favourite};
  }
}
