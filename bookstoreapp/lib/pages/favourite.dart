import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'package:flutter/rendering.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'bookstoreapp.dart';

class FavouriteBooks extends StatefulWidget {
  @override
  _FavouriteBooksState createState() => _FavouriteBooksState();
}

class _FavouriteBooksState extends State<FavouriteBooks> {
  // List<Book> _isFavourite = books.where((i) => i.favourite).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          title: Text("Favoutrite Books"),
          backgroundColor: Colors.blue,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 2),
          // itemCount: _isFavourite.length,
          itemBuilder: (context, index) {
            return Container(
              // child: BookCards(
              //   books: _isFavourite[index],
              // ),
            );
          },
        ));
  }
}
