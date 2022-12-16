// ignore_for_file: unused_field, unnecessary_new, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop_app/pages/products.dart';
import 'package:shop_app/pages/sell_page.dart';

class HomePage extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
       RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(
      Duration(seconds: 3),
      () {
        // _btnController.success();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "Logo",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      // onTap: _doSomething,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellPage()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text('Savdo',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _doSomething,
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text('To`lov',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _doSomething,
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text('Hisobot',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _doSomething,
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Icon(Icons.refresh),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      // onTap: _doSomething,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsList()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text('To`lov',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _doSomething,
                      child: Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text('To`lov',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
