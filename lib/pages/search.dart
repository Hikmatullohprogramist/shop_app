import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/services/services/service.dart';

import '../services/models/product_model.dart';
import 'page.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
  // late Future<List<Product>?> products;
  RemoteService products = RemoteService();
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Product>?>(
      future: products.searchItems(query),
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
                      child: AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration:
                            const Duration(milliseconds: 2500),
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
                                    : Colors.redAccent,
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


                                      child: Text(

                                        snapshot.data![index].name
                                            .toString(),
                                        maxLines: 2,
                                        softWrap: true,

                                        textWidthBasis: TextWidthBasis.parent,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(

                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          );


        }
        else if (snapshot.hasError) {
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text("Mahsulotlarni qidirish"),
    );
  }
}
