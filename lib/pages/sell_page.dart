import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/pages/page.dart';
import 'package:shop_app/services/models/product_model.dart';

import '../services/services/product_service.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  List<Product>? products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    print(products);
  }

  getData() async {
    products = await RemoteService().getModels();
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
      body: ListView.builder(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: products!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWidget(
                    name: products![index].name.toString(),
                    price1: products![index].price1.toString(),
                    price2: products![index].price2.toString(),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 20),
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products![index].name.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text("${products![index].price2} so`m"),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text("+1"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
