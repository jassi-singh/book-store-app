import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/card_item.dart';
import 'package:bookstoreapp/widgets/stack_container.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/main.dart';

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
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                RaisedButton(
                  //elevation: 50,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return MyApp();
                      },
                    ));
                  },
                  //padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Text('Log Out',
                          style: TextStyle(fontSize: 20, color: Colors.black54,fontWeight: FontWeight.bold),),
                      //Icon(Icons.power_settings_new),
                    ],
                  ),

                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.lightBlue)
                  ),
                ),
              ],
            ),

          ],


        ),

      ),
    );
  }
}