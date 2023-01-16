// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_app/services/services/service.dart';

class SellItem extends StatefulWidget {
  String name;
  String amount;
  int price;
  String date;
  String time;
  String status;
  int price1;
  int id;


  SellItem({
    required this.name,
    required this.amount,
    required this.price,
    required this.date,
    required this.time,
    required this.status,
    required this.price1,
    required this.id,

  });

  @override
  State<SellItem> createState() => _SellItemState();
}

class _SellItemState extends State<SellItem> {


  // ignore: non_constant_identifier_names
  delete_item(int id)=> setState(() async {
   await RemoteService().deleteItem(id);
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) => setState(() {
                delete_item(widget.id);
              })),
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        child: ListTile(
          title: Text(widget.name),
          onTap: () {},
          subtitle: Text(widget.price.toString()),
          trailing: Container(
            height: 50,
            width: 170,
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child:  Center(
                    child: GestureDetector(
                      onTap: (){

                        setState(() {
                          int.parse(widget.amount+= "1");

                        });
                      },
                      child: const Text(
                        "-1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Text(widget.amount),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
