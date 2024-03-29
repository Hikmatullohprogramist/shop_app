// To parse this JSON data, do
//
//     final sellModel = sellModelFromJson(jsonString);

import 'dart:convert';

List<SellModel> sellModelFromJson(dynamic str) =>
    List<SellModel>.from(str.map((x) => SellModel.fromJson(x)));

String sellModelToJson(List<SellModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellModel {
  SellModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
    required this.date,
    required this.time,
    required this.status,
    required this.price1,
    // ignore: non_constant_identifier_names
    required this.user,
    required this.product_id,
    required this.all_sum,
  });

  int? id;
  String? name;
  String? amount;
  String? price;
  DateTime? date;
  String? time;
  int? status;
  String? price1;
  int? user;
  // ignore: non_constant_identifier_names
  int? product_id;
  // ignore: non_constant_identifier_names
  String? all_sum;
  factory SellModel.fromJson(Map<String, dynamic> json) => SellModel(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        price1: json["price1"],
        user: json["user"],
        product_id: json["product_id"],
        all_sum: json["all_sum"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "price": price,
        "date": date,
        "time": time,
        "status": status,
        "price1": price1,
        "user": user,
        "product_id":product_id,
        "all_sum":all_sum,
      };
}
