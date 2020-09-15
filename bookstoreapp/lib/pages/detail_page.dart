import 'dart:convert';
import 'package:bookstoreapp/widgets/cartBooks.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/models/book.dart';


class DetailPage extends StatefulWidget {
  final Book books;
  const DetailPage(this.books);
  @override
  _DetailPageState createState() => _DetailPageState();
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // bottomSheet: BottomAppBar(
      //   child: new Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Expanded(child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: <Widget>[
      //               // RaisedButton(
      //               //   onPressed: () {
      //               //     //bloc.addToCart(shopList[i]);
      //               //   },
      //               //   child: const Text('Add To Cart',
      //               //       style: TextStyle(fontSize: 20, color: Colors.black54)),
      //               //   color: Colors.blue,
      //               //   shape: RoundedRectangleBorder(
      //               //       borderRadius: BorderRadius.circular(18.0),
      //               //       side: BorderSide(color: Colors.lightBlue)
      //               //   ),
      //               // ),
      //
      //             ],
      //           ),
      //         ],
      //       )),
      //     ],
      //   ),
      // ),
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
                  height: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.books.image),
                      fit: BoxFit.cover,
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
                Text(
                  widget.books.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.books.writer,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
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
                SizedBox(
                  height: 15,
                ),
                Text(widget.books.details),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     RaisedButton(
                //       onPressed: () {
                //         //bloc.addToCart(shopList[i]);
                //       },
                //       child: const Text('Add To Cart',
                //           style: TextStyle(fontSize: 20, color: Colors.black54)),
                //       color: Colors.blue,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(18.0),
                //           side: BorderSide(color: Colors.lightBlue)
                //       ),
                //     ),
                //   ],
                // ),

              ],

            ),
          )

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },

        child: new Icon(Icons.add_shopping_cart, color: Colors.white, ),
        elevation: 4.0,
        backgroundColor: Colors.blue,
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: RaisedButton(
      //     onPressed: () {
      //       //bloc.addToCart(shopList[i]);
      //     },
      //     child: const Text('Add To Cart',
      //         style: TextStyle(fontSize: 20, color: Colors.black54)),
      //     color: Colors.blue,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(18.0),
      //         side: BorderSide(color: Colors.lightBlue)
      //     ),
      //   ),
      //
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   child: new Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Expanded(child: SizedBox(width: 18,)),
      //       Expanded(child: IconButton(icon: Icon(Icons.show_chart)),),
      //       Expanded(child: new Text('timpu')),
      //
      //     ],
      //   ),
      // ),


    );
  }
}
