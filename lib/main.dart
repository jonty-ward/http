import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

var text;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<String> getData() async {
      final url = Uri.parse(
          'api.openweathermap.org/data/2.5/weather?q=london&appid=c7b22e378e8404d1ac5d214062e5f766');
      http.Response response =
          await http.get(url, headers: {'Accept': 'application/json'});

      // if (response.statusCode == 200) {
      //   // var body = convert.jsonDecode(response.body) as Map<String, dynamic>;
      //   // var itemCount = body["data"];
      //   // print(itemCount.map((item) => {item["email"]}.toString()));
      //   // text = itemCount.map((item) => {item["email"]}.toString());

      // }
      // print(response.body);
      // print('Response drilled down>>>>>>>>>>>>>>>>>>>>>');
      print(response.body);
      return response.body;
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: Text('Get Data!'),
          ),
        ),
      ),
    );
  }
}
