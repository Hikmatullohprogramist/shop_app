// ignore_for_file: must_be_immutable, unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/pages/sell_page.dart';

import '../services/services/service.dart';

class MyWidget extends StatefulWidget {
  int id;
  String name;
  String price1;
  String price2;

  MyWidget(
      {super.key,
      required this.id,
      required this.name,
      required this.price1,
      required this.price2});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _amountController = TextEditingController();
  final _priceController = TextEditingController();

  postData(int id, String amount) async {
    RemoteService().fetchData(
      id,
      amount,
    );
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
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextField(
              controller: _amountController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          //Price edit
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextField(
              controller: _priceController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                p_amount = double.parse(_amountController.text);
                p_price = double.parse(_priceController.text);
                p_summa = p_amount * double.parse(widget.price2);
              });
              postData(
                widget.id,
                _amountController.text,
              );

              print(RemoteService().getModels());
           // if()
           //   {
           //
           //   }
           // else
           //   {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const SellPage()),
               );
             // }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
              child: const Center(
                child: Text(
                  "Saqlash",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              child: const Center(
                child: Text(
                  "Bekor qilish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
