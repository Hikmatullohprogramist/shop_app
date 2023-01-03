// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  int _selectRadio = 0;

  @override
  void initState() {

    super.initState();
    _selectRadio = 0;
  }

  setSelectRadio(int value) {
    setState(() {
      _selectRadio = value;
    });
  }

  var onSelect1 = false;
  var onSelect2 = false;
  var onSelect3 = false;
  var onSelect4 = false;
  var onVisible = false;
  var errorText = false;

  void ontapped1() {
    setState(() {
      onSelect1 = true;
      onSelect2 = false;
      onSelect3 = false;
      onSelect4 = false;
      onVisible = true;
    });
  }

  void ontapped2() {
    setState(() {
      onSelect1 = false;
      onSelect2 = true;
      onSelect3 = false;
      onSelect4 = false;
      onVisible = true;
    });
  }

  // void ontapped3() {
  //   setState(() {
  //     onSelect1 = false;
  //     onSelect2 = false;
  //     onSelect3 = true;
  //     onSelect4 = false;
  //     onVisible = false;
  //     errorText = true;
  //   });
  // }

  void ontapped4() {
    setState(() {
      onSelect1 = false;
      onSelect2 = false;
      onSelect3 = false;
      onSelect4 = true;
      onVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To'lov oynasi",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                //Naqd
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: onSelect1 ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Naqd",
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio(
                            value: 1,
                            groupValue: _selectRadio,
                            onChanged: (val) {
                              print("Radio $val");
                              setSelectRadio(val!);
                              ontapped1();
                            }),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                //Plastik
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: onSelect2 ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Plastik",
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio(
                            value: 2,
                            groupValue: _selectRadio,
                            onChanged: (val) {
                              setSelectRadio(val!);
                              ontapped2();
                            }),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                //Nasiya
                // Container(
                //     padding: EdgeInsets.only(left: 10, right: 10),
                //     height: 50,
                //     width: 250,
                //     decoration: BoxDecoration(
                //         color: onSelect3 ? Colors.green : Colors.red,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Text(
                //           "Nasiya",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //         Radio(
                //             value: 3,
                //             groupValue: _selectRadio,
                //             onChanged: (val) {
                //               print("Radio $val");
                //               setSelectRadio(val!);
                //               ontapped3();
                //             }),
                //       ],
                //     )),
       /*         SizedBox(
                  height: 20,
                ),*/

                //Click
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: onSelect4 ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Click",
                          style: TextStyle(color: Colors.white),
                        ),
                        Radio(
                            value: 4,
                            groupValue: _selectRadio,
                            onChanged: (val) {
                              setSelectRadio(val!);
                              ontapped4();
                            }),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: onVisible,
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                width: 250,
                child: Center(
                  child: Text(
                    "Sotish",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
