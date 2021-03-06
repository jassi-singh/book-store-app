import 'dart:convert';
import 'package:bookstoreapp/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'package:bookstoreapp/widgets/categories.dart';
import 'package:flutter/rendering.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:bookstoreapp/utils/books_service.dart';
import 'package:get_it/get_it.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

BooksService get service => GetIt.I<BooksService>();

class _MainPageState extends State<MainPage> {
  APIResponse<List<Book>> _apiResponse;
  bool _isLoading = false;
  Future<List<Book>> futureBook;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchBooks();
    print('check fetchbook');

  }

  _fetchBooks() async {
    setState(() {
      print('true');
      _isLoading = true;
    });

    _apiResponse = await service.getBooksList();

    setState(() {
      print('false');
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: deviceHeight / 9,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.bookmark_border,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Reader'Stop",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_horiz,
                    size: 40,
                  )
                ],
              ),
            ),
            Container(
              height: deviceHeight / 10,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    icon: Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, top: 18, bottom: 18),
              height: deviceHeight / 7,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 160,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: 4),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.whatshot,
                          color: Colors.blue,
                          size: 48,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Trending Books",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                      width: 160,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(left: 4),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.notifications_active,
                            color: Colors.blue,
                            size: 48,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "New Arrivals",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: deviceHeight / 14,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text("Literature"),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context, index) => Categories(),
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (_isLoading) {
                  return CircularProgressIndicator();
                }
                if (_apiResponse.error) {
                  return Center(
                    child: Text(_apiResponse.errormessage.toString()),
                  );
                }
                return Container(
                  height: deviceHeight / 2.3,
                  padding: EdgeInsets.only(left: 16, bottom: 16),
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => BookCards(
                              books: _apiResponse.data[index],
                            ),
                            shrinkWrap: true,
                            itemCount: _apiResponse.data.length,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: deviceHeight / 14,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text("Literature"),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context, index) => Categories(),
                          itemCount: 4,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (_isLoading) {
                  return CircularProgressIndicator();
                }
                if (_apiResponse.error) {
                  return Center(
                    child: Text(_apiResponse.errormessage.toString()),
                  );
                }
                return Container(
                  height: deviceHeight / 2.3,
                  padding: EdgeInsets.only(left: 16, bottom: 16),
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => BookCards(
                              books: _apiResponse.data[index],
                            ),
                            shrinkWrap: true,
                            itemCount: _apiResponse.data.length,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
