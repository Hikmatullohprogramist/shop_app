import 'package:dio/dio.dart';
import 'package:shop_app/services/models/product_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Product>?> getModels() async {
    var dio = Dio();
    try {
      var response = await dio.get('http://192.168.88.14:8001/products');
      var json = response.data;
      if (response.statusCode == 200) {
        return productFromJson(json);
      }
      // return productFromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
