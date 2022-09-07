import 'package:flutter/material.dart';
import 'package:project/ui/detail.dart';
import 'package:project/ui/home.dart';
import 'package:project/ui/indonesia.dart';
import 'package:project/ui/intro.dart';

import 'package:project/ui/provinsi.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Intro(),
    );
  }
}
