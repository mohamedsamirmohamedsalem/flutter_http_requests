import 'package:flutter/material.dart';
//for import http third package library
import 'package:http/http.dart' as http;
//for enable converting data to JSON Object
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> UserInfo = {
      'name': 'mohamed',
      'age': '25',
      'phone': '01145',
      'height': '190',
      'weight': '94',
    };

    void HttpPost() {
      http.post('https://flutter-http-requests.firebaseio.com/Users.json',
          body: json.encode(UserInfo));
    }

    HttpPost();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http Requests'),
        ),
        body: Container(),
      ),
    );
  }
}
