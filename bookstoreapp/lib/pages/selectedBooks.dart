import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'bookstoreapp.dart';

// List<Book> _isCart = books.where((i) => i.cart).toList();

class ShopItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2),
      // itemCount: _isCart.length,
      itemBuilder: (context, index) {
        return Container(
          // child: BookCards(
          //   books: _isCart[index],
          // ),
        );
      },
    );
  }
}
