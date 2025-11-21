import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._internal();
  static final ApiService instance = ApiService._internal();
  factory ApiService() => instance;

  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  final http.Client client = http.Client();

  Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse("$_baseUrl$endpoint");

    try {
      final response = await client
          .get(
            uri,
            headers: {
              "Accept": "application/json",
              "User-Agent": "FlutterApp/1.0",
            },
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      throw Exception("Something went wrong");
    }

    on SocketException {
      throw Exception("No internet connection");
    }

    on TimeoutException {
      throw Exception("Something went wrong");
    }

    on FormatException {
      throw Exception("Something went wrong");
    }

    catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
