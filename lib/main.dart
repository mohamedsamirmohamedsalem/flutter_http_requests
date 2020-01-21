import 'package:flutter/material.dart';
//for import http third package library
import 'package:http/http.dart' as http;
//for enable converting data to JSON Object
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, dynamic> userInfo = {
    'name': 'mohamed',
    'age': '25',
    'phone': '01145',
    'height': '190',
    'weight': '94',
  };

  void httpPost() {
    http
        .post('https://flutter-http-requests.firebaseio.com/Users.json',
            body: json.encode(userInfo))
        .then((http.Response response) {
      //get firebase unique id
      final Map<String, dynamic> responseData = json.decode(response.body);
      String uniqueID = responseData['name'];
      //print('$uniqueID ////////////////');
    });
  }

  void httpGet() {
    http
        .get('https://flutter-http-requests.firebaseio.com/Users.json')
        .then((http.Response response) {
      // print(json.decode(response.body));
      final Map<String, dynamic> userList = json.decode(response.body);
      print('$userList');
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http Requests'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  httpPost();
                },
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  'Get',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  httpGet();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
