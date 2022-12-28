// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';


import '../services/models/sell_model.dart';
import '../services/services/service.dart';

class Sellin extends StatefulWidget {
  const Sellin({Key? key}) : super(key: key);

  @override
  State<Sellin> createState() => _SellinState();
}

class _SellinState extends State<Sellin> {
  late Future<List<SellModel>?> sellmodel;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    print("Tovarlar royxati $sellmodel");
  }

  getData() async {
    sellmodel = RemoteService().getsellModel();
    // ignore: unrelated_type_equality_checks
    if (sellmodel != Null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  delete_item(int id) async {
    await RemoteService().deleteItem(id);
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SellModel>?>(
        future: sellmodel,
        builder:
            (BuildContext context, AsyncSnapshot<List<SellModel>?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Lottie.asset("lib/assets/isempty.json", animate: true),
              );
            }
            return Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // return SellItem(
                          //   name: snapshot.data![index].name,
                          //   amount: snapshot.data![index].amount.toString(),
                          //   price: int.parse(snapshot.data![index].price),
                          //   date: snapshot.data![index].date.toString(),
                          //   time: snapshot.data![index].time,
                          //   status: "1",
                          //   price1: int.parse(snapshot.data![index].price1),
                          //   id: snapshot.data![index].id,
                          //
                          // );
                          return Card(
                            elevation: 3,
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: ((context) =>  delete_item(snapshot.data![index].id)),
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                  )
                                ],
                              ),
                              child: ListTile(
                                title: Text(snapshot.data![index].name),
                                onTap: () {},
                                subtitle: Text(
                                    snapshot.data![index].price.toString()),
                                trailing: Container(
                                  height: 50,
                                  width: 170,
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red,
                                        ),
                                        child:  const Center(
                                          child: Text(
                                            "-1",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Text(snapshot.data![index].amount
                                          .toString()),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "+1",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        TextButton(onPressed: () {}, child: Text("Naqd")),
                        TextButton(onPressed: () {}, child: Text("Plastik")),
                        TextButton(onPressed: () {}, child: Text("Nasiya")),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
