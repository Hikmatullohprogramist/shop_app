import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shop_app/services/models/product_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Product>?> getModels() async {
    // var client = http.Client();
    // var uri = Uri.parse("http://192.168.88.14:8000/products");
    // var response = await client.get(uri);
    var dio = Dio();
    var response = await dio.get('http://192.168.88.14:8000/products');
    try {
      if (response.statusCode == 200) {
        var json = response.data;
        print(json);
        return productFromJson(json);
      }
    } catch (e) {
      print(e);
    }
  }
}
