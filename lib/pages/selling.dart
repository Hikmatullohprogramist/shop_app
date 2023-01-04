// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_app/pages/pay.dart';

import '../services/models/sell_model.dart';
import '../services/services/service.dart';

class Sellin extends StatefulWidget {
  final int summa;

  Sellin(this.summa);

  @override
  State<Sellin> createState() => _SellinState();
}

class _SellinState extends State<Sellin> {
  RefreshController refreshController = RefreshController(initialRefresh: true);
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
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // ignore: unrelated_type_equality_checks
    if (sellmodel != Null) {
      setState(() {
        isLoaded = true;
      });
    } else {
    }
  }

  delete_item(int id) {
    setState(() {
      RemoteService().deleteItem(id);

      Future.delayed(Duration(milliseconds: 100), () {
        getData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<List<SellModel>?>(
        future: sellmodel,
        builder:
            (BuildContext context, AsyncSnapshot<List<SellModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
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
                                    onPressed: ((context) => delete_item(
                                        snapshot.data![index].id)),
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
                                        child: const Center(
                                          child: Text(
                                            "-1",
                                            style: TextStyle(
                                                color: Colors.white),
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
                                            style: TextStyle(
                                                color: Colors.white),
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
                    child: Card(
                      elevation: 50,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(

                              "Jami summa:",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              // widget.summa.toString(),
                              NumberFormat.simpleCurrency(decimalDigits: 1, locale: "uz-UZB",).format(widget.summa),
                              style: TextStyle(fontSize: 20),
                            ),
                            GestureDetector(
                             onTap: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => PayPage(),),
                               );
                             },
                              child: Container(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  child: const Center(
                                    child: Text(
                                      "To'lash ",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Lottie.asset("lib/assets/isempty.json", animate: true),
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
