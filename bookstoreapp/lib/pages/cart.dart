import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bookstoreapp/pages/selectedBooks.dart';
import 'package:bookstoreapp/pages/checkOut.dart';
import 'package:bookstoreapp/models/book.dart';

class CartPage extends StatefulWidget {
  final List<Book> iscart;
  const CartPage(this.iscart);
  @override
  _CartPageState createState() => _CartPageState();
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => ShopItems(iscart),
        '/checkout': (BuildContext context) => Checkout()
      },   
    );
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(255, 144, 0, .1),
      100: Color.fromRGBO(255, 144, 0, .2),
      200: Color.fromRGBO(255, 144, 0, .3),
      300: Color.fromRGBO(255, 144, 0, .4),
      400: Color.fromRGBO(255, 144, 0, .5),
      500: Color.fromRGBO(255, 144, 0, .6),
      600: Color.fromRGBO(255, 144, 0, .7),
      700: Color.fromRGBO(255, 144, 0, .8),
      800: Color.fromRGBO(255, 144, 0, .9),
      900: Color.fromRGBO(255, 144, 0, 1),
    };
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFF7000, color),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => ShopItems(widget.iscart),
        '/checkout': (BuildContext context) => Checkout()
      },
    );
  }
}