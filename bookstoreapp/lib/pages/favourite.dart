import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'package:bookstoreapp/pages/detail_page.dart';
import 'package:flutter/rendering.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';

class FavouriteBooks extends StatefulWidget {
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
      ),
        body: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return DetailPage();
              },
            ));
          },
          child: Container(
            child: BookCards(),
          ),
        );
      },
    ));
  }
}
