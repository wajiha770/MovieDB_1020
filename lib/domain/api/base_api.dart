import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_db/domain/config/config.dart';

class BaseAPI {
  Future<Response?> getRequest(String url, {String? urlExtension}) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    var apiKey = Config.apiKey;
    if (kDebugMode) {
      print("Url: $url/$urlExtension");
      print("Query Params: 'api_key: $apiKey'");
    }
    String finalUrl = url;
    if (urlExtension != null) {
      finalUrl = '$url/$urlExtension';
    }

    Response? response;
    try {
      response = await dio.get(
        finalUrl,
        queryParameters: {
          "api_key": apiKey,
        },
      );
    } catch (e) {
      response = null;
      if (kDebugMode) {
        print("error: $e");
      }
    }
    if (kDebugMode) {
      print("Response: $response");
    }
    return response;
  }
}
