import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ServicesHttpClient {
  static const _baseUrl = 'http://192.168.1.248:3000';

  //final ServicesTokenStorage _tokenStorage;

  Future<dynamic> post(
    String patch, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    print(body);
    print(jsonEncode(body));
    final response = await http.post(Uri.parse('$_baseUrl$patch'),
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    print("response.statusCode");
    print(response.statusCode);
    return response.statusCode;
  }
}
