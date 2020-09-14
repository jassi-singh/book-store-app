import 'package:bookstoreapp/models/book.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:bookstoreapp/utils/books_service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => BooksService());
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
        primarySwatch: Colors.grey[250],
        accentColor: Colors.orange,
        cursorColor: Colors.orange,
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
