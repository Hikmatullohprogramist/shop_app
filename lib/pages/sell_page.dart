// ignore_for_file: avoid_print

import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/services/models/product_model.dart';
import '../services/services/product_service.dart';

class SellPage extends StatefulWidget {
  const SellPage({
    super.key,
  });

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  late Future<List<Product>?> products;

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
    // ignore: unrelated_type_equality_checks
    if (products != Null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  postData(String name, int amount, String price, String date, String time, int status, String price1) async {
    RemoteService().fetchData(name, amount, price, date, time, status, price1);
  }

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
        title: const Text("Market"),
      ),
      body: FutureBuilder<List<Product>?>(
        future: products,
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>?> snapshot) {
          if (snapshot.hasData) {
            return BottomSheetBar(
              controller: _bsbController,
              willPopScope: true,
              expandedBuilder: (scrollController) {
                final itemList = List<int>.generate(12, (index) => index + 1);

                // Wrapping the returned widget with [Material] for tap effects
                return Material(
                  color: Colors.transparent,
                  child: CustomScrollView(
                    controller: scrollController,
                    shrinkWrap: true,
                    slivers: [
                      SliverFixedExtentList(
                        itemExtent: 56.0, // I'm forcing item heights
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ListTile(
                            title: Text(
                              itemList[index].toString(),
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  itemList[index].toString(),
                                ),
                              ),
                            ),
                          ),
                          childCount: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
              collapsed: Row(
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
                  IconButton(
                      onPressed: () {
                        _bsbController.expand();
                      },
                      icon: const Icon(
                        Icons.keyboard_double_arrow_up_outlined,
                        size: 45,
                      ))
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              body: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: ListView.builder(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 30),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
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
                                      int.parse(snapshot.data![index].amount) !=
                                              0
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
                                      GestureDetector(
                                        onTap: () {
                                          try {
                                            setState(() {
                                              price += int.parse(
                                                  snapshot.data![index].price2);
                                              amount += 1;
                                              postData(
                                                  snapshot.data![index].name,
                                                  amount,
                                                  snapshot.data![index].price2,
                                                  date,
                                                  time,
                                                  1,
                                                snapshot.data![index].price1,
                                              );
                                            });
                                          } catch (e) {
                                            print("Qandaydir xatolik  $e");
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
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
