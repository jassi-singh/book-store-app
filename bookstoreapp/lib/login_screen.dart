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
  Map<String, String> map;
  @override
  void initState() {
    super.initState();
    print('one');
    _fetchUser();
    print('two');
  }

  _fetchUser() async {
    setState(() {
      print('true');
      _isLoading = true;
    });
    print('three');
    _apiResponse = await service.getUsersList();
    setState(() {
      print('true');
      _isLoading = false;
    });
    print('four');
    print("#######");
    print(map);
  }

  Widget build(BuildContext context) {
    print('hello');
    for (var item in _apiResponse.data) {
      map[item.email] = item.password;
    }
    // return LoginScreen(map);
  }
}

const users = const {
  'a@b.c': '12345',
  'hunter@gmail.com': 'hunter',
  'qw@er.ty': 'e2fc714c4727ee9395f324cd2e7f331f'
};

class LoginScreen extends StatelessWidget {
  // LoginScreen(this.map);
  // final Map<String, String> map;
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    // print(map['jassi@gmail.com']);
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] !=
          md5.convert(utf8.encode(data.password)).toString()) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
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
