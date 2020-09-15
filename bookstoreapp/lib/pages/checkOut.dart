import 'package:flutter/material.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Checkout'), backgroundColor: Colors.blue,),

        body:  Center(child: Column(
          children: <Widget>[
           Row(
             children: <Widget>[

               Padding(
                 padding: const EdgeInsets.only(left: 150, top: 180),
                 child: Icon(
                   Icons.check_circle_outline,
                   size: 120,
                   color: Colors.blue,
                 ),
               ),

             ],
           ),
            Row(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 20),
                  child: Text('Bought Successfully',
                    style: TextStyle(fontSize: 20, color: Colors.black54,fontWeight: FontWeight.bold),),
                ),
              ],
            ),




          ],

        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return MainPage();
            },
          ));
        },
        child: new Icon(Icons.home,color: Colors.white,),
        elevation: 4.0,
        backgroundColor: Colors.blue,

      ),

    );
  }
}
