// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  String name;
  String price1;
  String price2;

  MyWidget(
      {super.key,
      required this.name,
      required this.price1,
      required this.price2});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )),
          Container(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )),
          Container(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("data"),
                  )),
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("data"),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
