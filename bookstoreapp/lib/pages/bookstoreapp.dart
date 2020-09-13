import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'package:bookstoreapp/widgets/categories.dart';
import 'package:flutter/rendering.dart';
import 'package:bookstoreapp/models/book.dart';

class ReaderStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    ); //MaterialApp
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

var books = [
    new Book(
      name: "Harry Potter 2",
      writer: "JK Rowling",
      price: 390,
      image: "https://universe.byu.edu/wp-content/uploads/2015/01/HP4cover.jpg",
      favourite: true,
      cart: true,
      details: "this is magical"
    ),
    new Book(
      name: "Harry Potter 5",
      writer: "JK Rowling",
      image: "https://universe.byu.edu/wp-content/uploads/2015/01/HP4cover.jpg",
      price: 250,
      favourite: true,
      cart: false,
      details: "this is magical"
    ),
    new Book(
      name: "Harry Potter 6",
      writer: "JK Rowling",
      image: "https://media.harrypotterfanzone.com/deathly-hallows-us-childrens-edition.jpg",
      price: 250,
      favourite: true,
      cart: true,
      details: "this is magical"
    ),
    new Book(
      name: "Harry Potter 4",
      writer: "JK Rowling",
      image: "https://universe.byu.edu/wp-content/uploads/2015/01/HP4cover.jpg",
      price: 20,
      favourite: false,
      cart: false,
      details: "this is magical"
    ),
    new Book(
      name: "Harry Potter 1",
      writer: "JK Rowling",
      image: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_scaled,f_auto,q_auto,dpr_2,c_scale,w_405/v1553632916/pro_pbid_13746.jpg",
      price: 25,
      favourite: true,
      cart: false,
      details: "this is magical"
    )
  ];

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "ReaderStop",
                      style: TextStyle(
                          color: Colors.red,
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
                    icon: Icon(Icons.search),
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
                          color: Colors.red,
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
                            color: Colors.red,
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
            Container(
              height: deviceHeight / 3,
              padding: EdgeInsets.only(left: 16, bottom: 16),
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[Row(
                      children: <Widget>[
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => BookCards(books: books[index],),
                          shrinkWrap: true,
                          itemCount: books.length,
                        )
                      ],
                    ),
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
            Container(
              height: deviceHeight / 3,
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
                          itemBuilder: (context, index) => BookCards(books: books[index],),
                          shrinkWrap: true,
                          itemCount: books.length,
                        )
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
