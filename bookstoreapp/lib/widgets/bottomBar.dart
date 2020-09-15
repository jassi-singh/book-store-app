import 'dart:convert';
import 'package:bookstoreapp/pages/cart.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';
import 'package:bookstoreapp/pages/favourite.dart';
import 'package:bookstoreapp/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/utils/books_service.dart';
import 'package:get_it/get_it.dart';
import 'package:bookstoreapp/models/api_response.dart';
import 'package:bookstoreapp/models/book.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

BooksService get service => GetIt.I<BooksService>();

class _BottomBarState extends State<BottomBar> {
  APIResponse<List<Book>> _apiResponse;
  bool _isLoading = false;
  // Future<List<Book>> futureBook;
  @override
  void initState() {
    super.initState();
    _fetchBooks();
    print('check fetchbook');
  }

  _fetchBooks() async {
    setState(() {
      print('true');
      _isLoading = true;
    });

    _apiResponse = await service.getBooksList();
    setState(() {
      print('false');
      _isLoading = false;
    });
  }
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color.fromRGBO(80, 152, 200, 0.9),
            border: Border(
                top: BorderSide(
              color: Colors.lightBlueAccent,
            ))),
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MainPage();
                  },
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: 30,
                    color: Color.fromRGBO(0, 0, 255, 0.5),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 0, 255, 0.5),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return FavouriteBooks(_apiResponse.data.where((i) => i.favourite).toList());

                  },
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Color.fromRGBO(0, 0, 255, 0.5),
                  ),
                  Text(
                    "My Favorite",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 0, 255, 0.5),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                    return CartPage(_apiResponse.data.where((i) => i.cart).toList());

                    },
                  ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                      color: Color.fromRGBO(0, 0, 255, 0.5),
                    ),
                    Text(
                      "My Cart",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 255, 0.5),
                      ),
                    )
                  ],
                )),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Color.fromRGBO(0, 0, 255, 0.5),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 0, 255, 0.5),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      //),
    );
  }
}
