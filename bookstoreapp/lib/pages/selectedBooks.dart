import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'bookstoreapp.dart';


class ShopItems extends StatelessWidget {
  ShopItems(this.iscart);

  final List<Book>  iscart;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopItemsWidget(iscart),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  ShopItemsWidget(this.iscart);

  final List<Book> iscart;
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2),
      itemCount: iscart.length,
      itemBuilder: (context, index) {
        return Container(
          child: BookCards(
            books: iscart[index],
          ),
        );
      },
    );
  }
}