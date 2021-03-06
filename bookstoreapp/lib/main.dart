import 'package:bookstoreapp/models/book.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:bookstoreapp/utils/books_service.dart';
import 'package:bookstoreapp/utils/users_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => BooksService());
  GetIt.I.registerLazySingleton(() => UsersService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        cursorColor: Colors.blue,
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.white,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: Login(),
    );
  }
}
