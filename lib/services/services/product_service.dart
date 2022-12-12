import 'package:http/http.dart' as http;
import 'package:shop_app/services/models/product_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Product>?> getModels() async {
    var client = http.Client();
    var uri = Uri.parse("http://192.168.88.14:8000/products");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return productFromJson(json);
    }
  }
}
/*    var headers = {
  'Content-Type': 'text/plain'
};
var request = http.Request('POST', Uri.parse('http://192.168.88.14:8000/test'));
request.body = '''{\r\n    "name": "ABC",\r\n    "age": 18\r\n}''';
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
}
else {
  print(response.reasonPhrase);
}
  }*/