// ignore_for_file: must_be_immutable, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../services/services/service.dart';

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
  final _amountController = TextEditingController();
  final _priceController = TextEditingController();

  postData(String name, int amount, String price, String date, String time,
      int status, String price1, int user) async {
    RemoteService().fetchData(name, amount, price, date, time, status, price1, user);
  }

  @override
  Widget build(BuildContext context) {
    double p_amount = 0;
    double p_price = 0;
    double p_summa = 0;
    String time = DateFormat("HH:mm:ss").format(DateTime.now());
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //name
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          //amount edit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("-1"),
                  )),
              Container(
                width: 150,
                height: 50,
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("+1"),
                  )),
            ],
          ),
          //Price edit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("-500"),
                  )),
              Container(
                width: 150,
                height: 50,
                child: TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("+500"),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Bekor qilish"),
                  )),
              // Container(
              //   width: 150,
              //   height: 50,
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        p_amount = double.parse(_amountController.text);
                        p_price = double.parse(_priceController.text);
                        p_summa = p_amount * double.parse(widget.price2);
                      });
                      postData(
                        widget.name,
                        int.parse(_amountController.text),
                        _priceController.text,
                          date,
                        time,
                        1,
                        p_summa.toStringAsFixed(0),
                        1,
                      );
                    },
                    child: Text("Saqlash"),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
