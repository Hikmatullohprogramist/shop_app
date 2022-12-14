import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop_app/pages/products.dart';

class HomePage extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(
      Duration(seconds: 3),
      () {
        _btnController.success();
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
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child:
                          Text('Sotuv!', style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: _doSomething,
                    ),
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child:
                          Text('To`lov', style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: _doSomething,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child: Text('Hisobot',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: _doSomething,
                    ),
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh),
                      ),
                      controller: _btnController,
                      onPressed: _doSomething,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child:
                          Text('Ombor', style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsList()),
                        );
                      },
                    ),
                    RoundedLoadingButton(
                      width: 150,
                      height: 120,
                      child: Text('Vozvrat',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnController,
                      onPressed: _doSomething,
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
