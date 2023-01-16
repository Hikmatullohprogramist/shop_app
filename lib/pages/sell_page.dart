// ignore_for_file: avoid_print, unnecessary_string_interpolations

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/pages/page.dart';
import 'package:shop_app/pages/search.dart';
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
  List onchanged = [];
  TextEditingController textControl = TextEditingController();

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    print("Tovarlar royxati $products");
    // _bsbController.addListener(_onBsbChanged);
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

  int price = 0;
  int amount = 0;

  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

///////////searching
//   productSearch(String name) {
//     setState(() {
//       isLoaded = true;
//       RemoteService().searchItems("$name");
//       isLoaded = false;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Fenix Soft",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              width: 2,
            ),
            Image.asset(
              "lib/assets/logo.png",
              width: 28,
              height: 28,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
        // title: TitleWidget(),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Search(),
              //   ),
              // );
              showSearch(context: context, delegate: Search());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: isLoaded
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder<List<Product>?>(
              future: products,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>?> snapshot) {
                if (snapshot.hasData) {
                  return Column(
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
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .size
                                            .width /
                                        20),
                                height:
                                    MediaQuery.of(context).size.width / 4,
                                decoration: BoxDecoration(
                                  color: double.parse(snapshot
                                              .data![index].amount
                                              .replaceAll(",", ".")) >
                                          0
                                      ? Colors.white
                                      : Colors.red,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withOpacity(0.1),
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
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data![index].name
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                NumberFormat.simpleCurrency(
                                                  locale: "uz-UZB",
                                                  decimalDigits: 1,
                                                ).format(double.parse(snapshot.data![index].price2),),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
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
                                            overflow:
                                                TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            snapshot.data![index].amount,
                                          ),
                                        ),
                                      )
                                    ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            const SizedBox(
                              width: 150,
                            ),
                            Badge(
                              badgeContent: Text(
                                amount.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sellin(price)),
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart_outlined,
                                    size: 45),
                              ),
                            ),
                            const SizedBox(),

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
