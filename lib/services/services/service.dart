// ignore_for_file: avoid_print, unused_local_variable, body_might_complete_normally_nullable


import 'package:dio/dio.dart';
import 'package:shop_app/services/models/product_model.dart';

import '../models/sell_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Product>?> getModels() async {
    var dio = Dio();
    try {
      var response = await dio.get('http://192.168.88.56:8001/products');
      var json = response.data;
      if (response.statusCode == 200) {
        return productFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }
  Future fetchData(String name, int amount, String price, String date, String time, int status, String price1, int user) async {
    var dio = Dio();
    var headers = {'Content-Type': 'text/plain'};
    dynamic data = {
      "name": name,
      "amount": amount,
      "price": price,
      "date": date,
      "time": time,
      "status": status,
      "price1": price1,
      "user": user,
    };

    var response = await dio.post(
      "http://192.168.88.56:8001/sell",
      data: data,
    );
    return response.data;
  }
  Future<List<SellModel>?> getsellModel() async{
    var dio = Dio();
    try {
      var response = await dio.get('http://192.168.88.56:8001/sell');
      var json = response.data;
      if (response.statusCode == 200) {
        return sellModelFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }
  Future deleteItem(int id)async{
    var dio = Dio();
    var response1 = await dio.delete("http://192.168.88.56:8001/sell/$id",);
  }
  Future put(String name, int amount, String price, String date, String time, int status, String price1, int user) async{
    var dio = Dio();
    var headers = {'Content-Type': 'text/plain'};
    dynamic data = {
      "name": name,
      "amount": amount,
      "price": price,
      "date": date,
      "time": time,
      "status": status,
      "price1": price1,
      "user": user,
    };

    var response = await dio.put(
      "http://192.168.88.56:8001/sell",
      data: data,
    );
    return response.data;
  }





  }
