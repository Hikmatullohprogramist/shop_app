// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price1,
    required this.price2,
    required this.date,
    required this.amount,
  });

  int id;
  String name;
  int price1;
  int price2;
  DateTime date;
  String amount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price1: json["price1"],
        price2: json["price2"],
        date: json["date"] == null ? DateTime(0) : DateTime.parse(json["date"]),
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price1": price1,
        "price2": price2,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}", // ignore: unnecessary_non_null_assertion
        "amount": amount,
      };
}
