// ignore_for_file: unused_field, unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shop_app/pages/products.dart';
import 'package:shop_app/pages/sell_page.dart';
import 'package:shop_app/widgets/home_page_items.dart';
import 'package:shop_app/widgets/animation_page.dart';

class HomePage extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  // ignore: unused_element
  void _doSomething() async {
    Timer(
      Duration(seconds: 3),
      () {
        // _btnController.success();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Fenix Soft",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
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
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   height: 200,
              //   color: Colors.blue.shade500,
              //   child: Column(
              //     children: [],
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         // onTap: _doSomething,
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const SellPage()),
              //           );
              //         },
              //         child: Container(
              //           width: 330,
              //           height: 70,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Row(
              //             children: [
              //               const SizedBox(width: 30,),
              //               Image.asset("lib/assets/savdo_icon.png"),
              //               const SizedBox(width: 15,),
              //               const Center(
              //                 child: Text('Savdo',
              //                     style: TextStyle(color: Colors.white, fontSize:20 ,  fontFamily: 'Montserrat',  fontWeight: FontWeight.w600)),
              //               ),
              //               SizedBox(width: 160,),
              //
              //               Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white,)
              //             ],
              //           ),
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         // onTap: _doSomething,
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const SellPage()),
              //           );
              //         },
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Text('Savdo',
              //                 style: TextStyle(color: Colors.white, )),
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: _doSomething,
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Text('To`lov',
              //                 style: TextStyle(color: Colors.white)),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         onTap: _doSomething,
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Text('Hisobot',
              //                 style: TextStyle(color: Colors.white)),
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: _doSomething,
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Icon(Icons.refresh),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       GestureDetector(
              //         // onTap: _doSomething,
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const ProductsList()),
              //           );
              //         },
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Text('To`lov',
              //                 style: TextStyle(color: Colors.white)),
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: _doSomething,
              //         child: Container(
              //           width: 150,
              //           height: 120,
              //           decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: const Center(
              //             child: Text('To`lov',
              //                 style: TextStyle(color: Colors.white)),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              HomePageItem(
                icon: "lib/assets/savdo_icon.png",
                name: "Savdo",
                ontap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SellPage()),
                  // );
                  Navigator.push(context, SizeTransition5(const SellPage()));
                },
              ),
              HomePageItem(
                icon: "lib/assets/ombor_icon.png",
                name: "Ombor",
                ontap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SellPage()),
                  // );
                  Navigator.push(
                      context, SizeTransition5(const ProductsList()));
                },
              ),
              HomePageItem(
                icon: "lib/assets/wallet_icon.png",
                name: "To'lov",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SellPage()),
                  );
                },
              ),
              HomePageItem(
                icon: "lib/assets/report_icon.png",
                name: "Xisobot",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SellPage()),
                  );
                },
              ),
              HomePageItem(
                icon: "lib/assets/return_icon.png",
                name: "Qaytarish",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SellPage()),
                  );
                },
              ),
              HomePageItem(
                icon: "lib/assets/savdo_icon.png",
                name: "Savdo",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SellPage()),
                  );
                },
              ),
              // HomePageItem(icon: "lib/assets/savdo_icon.png",name: "Savdo",ontap: (){
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const SellPage()),
              //   );
              // },),
              SizedBox(
                height: 180,
              ),
              Text(
                "© Copyright Fenix Soft",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
