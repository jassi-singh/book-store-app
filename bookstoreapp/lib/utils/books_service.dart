import 'dart:convert';

import 'package:bookstoreapp/models/api_response.dart';
import 'package:bookstoreapp/models/book.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';
import 'package:bookstoreapp/utils/book_modify.dart';
import 'package:http/http.dart' as http;

class BooksService {
  Future<APIResponse<List<Book>>> getBooksList() {
    return http.get("http://10.0.2.2:4000/api/books").then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final books = <Book>[];
        for (var item in jsonData) {
          final book = Book(
            id: item['id'],
            name: item['name'],
            writer: item['writer'],
            details: item['details'],
            favourite: item['favourite'],
            cart: item['cart'],
            price: item['price'],
            image: item['image']

          );
          print(book.image);
          books.add(book);
        }
        return APIResponse<List<Book>>(data: books);
      }
      return APIResponse<List<Book>>(error: true);
    }).catchError((_) =>
        APIResponse<List<Book>>(error: true, errormessage: 'An error occured'));
  }
  Future<APIResponse<bool>> updateBook(int bookID,BookManipulation item) {
    return http
        .put('http://10.0.2.2:4000/api/books/'+bookID.toString(),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(item.toJson()))
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errormessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            error: true, errormessage: 'An error occured'));
  }
}
