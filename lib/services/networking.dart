import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  String url;

  Future getData() async {
    Uri apiUrl = Uri.parse(url);
    var data;
    http.Response response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
