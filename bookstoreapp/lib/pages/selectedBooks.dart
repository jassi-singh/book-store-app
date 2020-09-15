import 'package:flutter/material.dart';
import 'package:bookstoreapp/widgets/bottomBar.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/widgets/book_cards.dart';
import 'bookstoreapp.dart';
import 'package:bookstoreapp/utils/book_modify.dart';
import 'package:bookstoreapp/utils/books_service.dart';
import 'package:get_it/get_it.dart';
import 'package:bookstoreapp/pages/checkOut.dart';

class ShopItems extends StatelessWidget {
BooksService get service => GetIt.I<BooksService>();

  ShopItems(this.iscart);

  final List<Book>  iscart;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        backgroundColor: Colors.blue,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.shopping_cart),
        //     onPressed: () => Navigator.pushNamed(context, '/checkout'),
        //   )
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          for(Book book in iscart){
            final cart = BookManipulation(cart: false);
          final result = await service.updateBook(book.id, cart);
          print(book.id);
          final text = result.error
              ? (result.errormessage) ?? 'An error Occured'
              : 'Add to cart';
              }
        },
        child:GestureDetector(
          onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Checkout();
                },
              ));
            },
            child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        ) ,
        elevation: 4.0,
        backgroundColor: Colors.blue,
        
      ),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  ShopItemsWidget(this.iscart);

  final List<Book> iscart;
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2,childAspectRatio: 0.6),
      itemCount: iscart.length,
      itemBuilder: (context, index) {
        return Container(
          child: BookCards(
            books: iscart[index],
          ),
        );
      },
    );
  }
}