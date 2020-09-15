import 'package:bookstoreapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';
import 'package:bookstoreapp/utils/users_service.dart';
import 'package:bookstoreapp/models/api_response.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

UsersService get service => GetIt.I<UsersService>();

class _LoginState extends State<Login> {
  APIResponse<List<User>> _apiResponse;
  bool _isLoading = false;
  Map<String, String> map = {};
  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  _fetchUser() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getUsersList();
    setState(() {
      _isLoading = false;
    });
  }

  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!map.containsKey(data.name)) {
        return 'Username not exists';
      }
      print(md5.convert(utf8.encode(data.password)).toString());
      if (map[data.name] !=
          md5.convert(utf8.encode(data.password)).toString()) {
        return 'Password does not match';
      }
      return null;
    });
  }
  Future<String> _signup(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!map.containsKey(data.name)) {
        return 'Username not exists';
      }
      print(md5.convert(utf8.encode(data.password)).toString());
      if (map[data.name] !=
          md5.convert(utf8.encode(data.password)).toString()) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!map.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  Widget build(BuildContext context) {
    print('hello');
    for (var item in _apiResponse.data) {
      map[item.email] = item.password;
    }
    print(map);
    return FlutterLogin(
      title: "Reader'Stop",
      logo: 'assets/images/logo.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}