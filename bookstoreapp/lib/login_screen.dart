import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bookstoreapp/pages/bookstoreapp.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

const users = const {
  'a@b.c': '12345',
  'hunter@gmail.com': 'hunter',
  'qw@er.ty': 'e2fc714c4727ee9395f324cd2e7f331f'
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != md5.convert(utf8.encode(data.password)).toString()) {
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

      title: 'ReaderStop',
      logo: 'assets/images/logo.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ReaderStop(),
        ));
      },
      onRecoverPassword: _recoverPassword,

    );
  }
}