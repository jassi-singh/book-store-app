import 'dart:convert';
import 'package:bookstoreapp/utils/book_modify.dart';
import 'package:bookstoreapp/utils/books_service.dart';
import 'package:bookstoreapp/widgets/cartBooks.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:get_it/get_it.dart';

class DetailPage extends StatefulWidget {
  final Book books;
  const DetailPage(this.books);
  @override
  _DetailPageState createState() => _DetailPageState();
}

BooksService get service => GetIt.I<BooksService>();

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    int id = widget.books.id;
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
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cart = BookManipulation(cart: true);
          final result = await service.updateBook(widget.books.id, cart);
          print(widget.books.id);
          final text = result.error
              ? (result.errormessage) ?? 'An error Occured'
              : 'Add to cart';
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    content: Container(
                      height: 130,
                      child: Column(
                        children: [
                          Icon(
                            Icons.done,
                            color: Colors.lightBlue,
                            size: 100,
                          ),
                          Text("Added to Cart")
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(""),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
        },
        child: new Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
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
