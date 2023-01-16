// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/services/models/product_model.dart';

import '../services/services/service.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List<Product>?> products;
  var isLoaded = false;

  // ignore: duplicate_ignore
  @override
  // ignore: duplicate_ignore, duplicate_ignore
  void initState() {
    getData();
    super.initState();
    print(products);
       // ignore: avoid_print
 }

  getData() async {
    products = RemoteService().getModels();
    products.then((value){
      print(value);
    });
    // ignore: unrelated_type_equality_checks
    if (products != Null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
              return ListView.builder(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
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
                              bottom: MediaQuery.of(context).size.width / 20),
                          height: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text("${snapshot.data![index].price2} so`m"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else if(snapshot.hasError){

              return Center(child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_2tHSZX6XAG.json"),);

            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
