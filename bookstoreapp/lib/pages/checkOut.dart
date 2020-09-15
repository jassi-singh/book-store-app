import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Checkout'), backgroundColor: Colors.blue,),
        body:  Center(child: Text("You haven't taken any item yet"))
    );
  }
}