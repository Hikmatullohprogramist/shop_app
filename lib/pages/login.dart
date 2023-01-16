// ignore_for_file: unused_field, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController _login = TextEditingController();
  TextEditingController _parol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: const Center(
              child: Text("Logo"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                decoration: InputDecoration(

                  label: Text("Login"),
                  hintText: "Kiriting",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              width: double.infinity,
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  label: Text("Parol"),
                  hintText: "Kiriting",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () {   Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()),
              );},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                width: double.infinity,
                height: 50,
                child: const Center(
                  child: Text(
                    "Kirish",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          const Text(
            "© Copyright Fenix Soft",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
