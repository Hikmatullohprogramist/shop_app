// ignore_for_file: avoid_print

import 'package:badges/badges.dart';
import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/pages/page.dart';
import 'package:shop_app/pages/selling.dart';
import 'package:shop_app/services/models/product_model.dart';
import '../services/models/sell_model.dart';
import '../services/services/service.dart';

class SellPage extends StatefulWidget {
  const SellPage({
    super.key,
  });

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  late Future<List<Product>?> products;
  late Future<List<SellModel>?> sellmodel;
  List onchanged =[];
  TextEditingController textControl = TextEditingController();

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();

    print("Tovarlar royxati $products");
    _bsbController.addListener(_onBsbChanged);
  }

  getData() async {
    products = RemoteService().getModels();
    sellmodel = RemoteService().getsellModel();
    onchanged = products as List;
    // ignore: unrelated_type_equality_checks
    if (products != Null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // postData(int id, String amount, String price) async {
  //   RemoteService().fetchData(id, amount, price);
  // }

  final _bsbController = BottomSheetBarController();
  int price = 0;
  int amount = 0;

  bool _isCollapsed = true;
  bool _isExpanded = false;

  void _onBsbChanged() {
    if (_bsbController.isCollapsed && !_isCollapsed) {
      setState(() {
        _isCollapsed = true;
        _isExpanded = false;
      });
    } else if (_bsbController.isExpanded && !_isExpanded) {
      setState(() {
        _isCollapsed = false;
        _isExpanded = true;
      });
    }
  }

  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(          color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ),
          child:
          TextField(
            onChanged: (value){
              setState(() {
                onchanged = onchanged.where((element) => element.contains(value)).toList();
              });
            },
            controller: textControl,
            decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Product>?>(
        future: products,
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>?> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyWidget(
                                id: snapshot.data![index].id,
                                name: snapshot.data![index].name,
                                price1: snapshot.data![index].price1,
                                price2: snapshot.data![index].price2,
                              ),
                            ),
                          );
                        },
                        child: AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(milliseconds: 2500),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).size.width / 20),
                                height: MediaQuery.of(context).size.width / 4,
                                decoration: BoxDecoration(
                                  color:
                                      // ignore: unrelated_type_equality_checks
                                      snapshot.data![index].amount !=
                                              0.0
                                          ? Colors.white
                                          : Colors.red,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data![index].name.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Visibility(
                                        visible: false,
                                        child: Text(
                                          snapshot.data![index].amount
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                TextStyle(color: Colors.white),
                                            snapshot.data![index].amount,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jami summa",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              NumberFormat.simpleCurrency(
                                locale: "uz-UZB",
                                decimalDigits: 1,
                              ).format(price),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Badge(
                        badgeContent: Text(
                          amount.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sellin(price)),
                            );
                          },
                          icon: Icon(Icons.shopping_cart_outlined, size: 45),
                        ),
                      ),
                      SizedBox(),

                      // IconButton(
                      //     onPressed: () {
                      //
                      //     },
                      //     icon: const )
                    ],
                  ),
                ),
              ],
            );
            //
            //   },
            // );
            // Wrapping the returned widget with [Material] for tap effects
            // return  FutureBuilder<List<SellModel>?>(
            //     future: sellmodel,
            //     builder: (BuildContext context,
            //         AsyncSnapshot<List<SellModel>?> snapshot) {
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //             itemCount: snapshot.data!.length,
            //             itemBuilder: (context, index) {
            //               return Material(
            //                 child: Center(
            //                   child: Text(snapshot.data![index].name),
            //                 ),
            //               );
            //             });
            //       } else {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     });
            // return Material(
            //   color: Colors.transparent,
            //   child: CustomScrollView(
            //     controller: scrollController,
            //     shrinkWrap: true,
            //     slivers: [
            //       SliverFixedExtentList(
            //         itemExtent: 56.0, // I'm forcing item heights
            //         delegate: SliverChildBuilderDelegate(
            //               (context, index) => ListTile(
            //             title: Text(
            //               snapshot.data![index].name.toString(),
            //               style: const TextStyle(fontSize: 20.0),
            //             ),
            //             onTap: () => showDialog(
            //               context: context,
            //               builder: (context) => AlertDialog(
            //                 // title: Text(
            //                 //   itemList[index].toString(),
            //                 // ),
            //               ),
            //             ),
            //           ),
            //           childCount: 12,
            //         ),
            //       ),
            //     ],
            //   ),
            // );

          } else if (snapshot.hasError) {
            return Center(
              child: Lottie.network(
                  "https://assets5.lottiefiles.com/packages/lf20_2tHSZX6XAG.json"),
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
