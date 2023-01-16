// ignore_for_file: avoid_print, unused_local_variable, body_might_complete_normally_nullable, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:shop_app/services/models/product_model.dart';

import '../../pages/constants.dart';
import '../models/sell_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Product>?> getModels() async {
    var dio = Dio();
    try {
      var response = await dio.get('${baseUrl}products?id=*&name=*');
      var json = response.data;
      if (response.statusCode == 200) {
        return productFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future fetchData(int id, String amount) async {
    var dio = Dio();
    var headers = {'Content-Type': 'text/plain'};
    late String status;
    dynamic data = {
      "id": id,
      "amount": amount,
    };

    var response = await dio.patch(
      "${baseUrl}products?id=$id&amount=$amount",
      data: data,
    );
    print(response.data);
    if (response.data == "False") {
      status = "FALSE";
      return status;
    } else {
      status = "TRUE";
      return status;
    }
  }

  Future<List<SellModel>?> getsellModel() async {
    var dio = Dio();
    try {
      var response = await dio.get('${baseUrl}sell?id=*');
      var json = response.data;
      if (response.statusCode == 200) {
        return sellModelFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future deleteItem(int id) async {
    var dio = Dio();
    var response1 = await dio.delete(
      "${baseUrl}sell/$id",
    );
  }

  Future put(List<SellModel> selList) async {
    var dio = Dio();
    var headers = {'Content-Type': 'text/plain'};
    dynamic data = {selList};

    var response = await dio.put(
      "http://192.168.137.36:8000/sell",
      data: data,
    );
    return response.data;
  }

  Future<List<Product>?> searchItems(String query) async {
    var dio = Dio();
    List<Product> result = [];
    try {
      var response = await dio.get('${baseUrl}products?id=*&name=$query');
      var json = response.data;
      if (response.statusCode == 200) {
        // ignore: unnecessary_null_comparison
        if (query != null) {
          result = result
              .where((element) => element.name.toLowerCase().contains(query))
              .toList();
        }
        return productFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future sell(String type) async {
    var dio = Dio();

      var response1 = await dio.post(
        "${baseUrl}selled?type=$type",
      );
      return response1.data;
    }


  Future sellBuyer(String type, int id)async{
    var dio = Dio();
    var response = await dio.post('${baseUrl}selled?type=$type&id=$id');
    return response.data;
  }
}
