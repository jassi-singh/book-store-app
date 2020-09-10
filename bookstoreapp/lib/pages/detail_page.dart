import 'dart:convert';
import 'package:bookstoreapp/widgets/cartBooks.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return  Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}


class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Hero(
                tag: "img",
                child: Container(
                  child: Container(
                    color: Colors.yellow,
                    child: Center(
                      child: FlutterLogo(
                        size: 300,
                        style: FlutterLogoStyle.horizontal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.2,
            left: 24,
            right: 16,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("FLutter Live Coding Book",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),SizedBox(height: 8,),
                Text("Jassi",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,),
                ),SizedBox(height: 8,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text("148 Favorites"),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    RaisedButton(

                      onPressed: () {
                        //bloc.addToCart(shopList[i]);
                      },

                      child: const Text('Add To Cart', style: TextStyle(fontSize: 20)),


                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
