import 'dart:convert';

import 'package:http/http.dart' as http';

class NetworkHelper {
  NetworkHelper({required this.url});

  String url;

  Future getData() async {
    Uri apiUrl = Uri.parse(url);
    Map<String, dynamic> data;
    http.Response response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
