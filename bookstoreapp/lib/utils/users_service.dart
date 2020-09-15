import 'dart:convert';

import 'package:bookstoreapp/models/api_response.dart';
import 'package:bookstoreapp/models/user.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<APIResponse<List<User>>> getUsersList() {
    return http.get("http://10.0.2.2:4000/api/users").then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final users = <User>[];
        for (var item in jsonData) {
          final user = User(
            email: item['email'],
            password: item['password'],
          );
          print(user.password);
          users.add(user);
        }
        return APIResponse<List<User>>(data: users);
      }
      return APIResponse<List<User>>(error: true);
    }).catchError((_) =>
        APIResponse<List<User>>(error: true, errormessage: 'An error occured'));
  }
}
