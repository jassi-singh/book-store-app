import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'package:flutter/rendering.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'bookstoreapp.dart';

class FavouriteBooks extends StatefulWidget {
  final List<Book> isfavourite;
  const FavouriteBooks(this.isfavourite);
  @override
  _FavouriteBooksState createState() => _FavouriteBooksState();
}

class _FavouriteBooksState extends State<FavouriteBooks> {
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
              crossAxisCount: 2, mainAxisSpacing: 2,childAspectRatio: 0.6),
          itemCount: widget.isfavourite.length,
          itemBuilder: (context, index) {
            return Container(
                child: BookCards(
                  books: widget.isfavourite[index],
                ),
                );
          },
        ));
  }
}
