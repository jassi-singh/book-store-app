import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/card_item.dart';
import 'package:bookstoreapp/widgets/stack_container.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CardItem(),
              shrinkWrap: true,
              itemCount: 4,
            )
          ],
        ),
      ),
    );
  }
}