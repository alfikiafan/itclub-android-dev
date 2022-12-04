import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Solo',
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
const DetailScreen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(children: <Widget>[
      Container(margin: const EdgeInsets.only(top: 16.0),
          child: const Text('Keraton Kasunanan Surakarta')),
    ],),
  );
}
}