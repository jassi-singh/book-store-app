import 'package:flutter/material.dart';

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

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Color.fromRGBO(20, 30, 180, 0.5),
            border: Border(
              top: BorderSide(
                color: Color.fromRGBO(200, 150, 33, 0.8),
              )
            )
          ),

          height: 72,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home, size: 30,),
                  Text("Home", style: TextStyle(
                    fontSize: 12,
                  ),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.book, size: 30, color: Colors.red,),
                  Text("Bookmarks", style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite, size: 30,color: Colors.red,),
                  Text("My Favorite", style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_shopping_cart, size: 30,color: Colors.red,),
                  Text("My Cart", style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: deviceHeight/9,
              child: Row(
                children: <Widget>[
                  Icon(Icons.bookmark_border, size: 40, color: Colors.red,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("ReaderStop", style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz, size: 40,)
                ],
              ),
            ),
            Container(
              height: deviceHeight/10,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
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
              height: deviceHeight/7,
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
                        Icon(Icons.whatshot,color: Colors.red,size: 48,),
                        SizedBox(width: 4,),
                        Text("Trending Books", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(width: 16,),
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
                          Icon(Icons.notifications_active,color: Colors.red,size: 48,),
                          SizedBox(width: 8,),
                          Text("New Arrivals", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],
                      )
                  ),
                ],
              ),

            ),
            Container(
              height: deviceHeight/3,
              decoration: BoxDecoration(color: Colors.green),
            ),
            Container(
              height: deviceHeight/9,
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Container(
              height: deviceHeight/11,
              decoration: BoxDecoration(color: Colors.cyan),
            ),
            Container(
              height: deviceHeight/3,
              decoration: BoxDecoration(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}


