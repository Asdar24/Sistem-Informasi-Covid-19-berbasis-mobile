import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/home.dart';
import 'package:project/ui/indonesia.dart';
import 'package:project/ui/provinsi.dart';

class bar extends StatefulWidget {
  const bar({Key? key}) : super(key: key);

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  int page = 1;
  final pagenya = [Homeindo(), Home(), homewidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pagenya[page],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.green,
            items: [
              TabItem(icon: Icons.coronavirus_outlined, title: 'Indonesia'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.coronavirus, title: 'Provinsi'),
            ],
            initialActiveIndex: page, //optional, default as 0
            onTap: (int i) {
              setState(() {
                page = i;
              });
            }));
  }
}
