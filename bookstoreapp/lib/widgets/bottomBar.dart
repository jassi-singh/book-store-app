import 'dart:convert';
import 'package:bookstoreapp/pages/cart.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';
import 'package:bookstoreapp/pages/favourite.dart';
import 'package:bookstoreapp/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color.fromRGBO(20, 30, 180, 0.5),
            border: Border(
                top: BorderSide(
              color: Color.fromRGBO(200, 150, 33, 0.8),
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
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return FavouriteBooks();
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
                    color: Colors.red,
                  ),
                  Text(
                    "My Favorite",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return CartPage();
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
                      color: Colors.red,
                    ),
                    Text(
                      "My Cart",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
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
                    color: Colors.red,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
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
