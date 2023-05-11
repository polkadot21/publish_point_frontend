import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:publishpoint/src/model/http_result.dart';

class ApiProvider {
  String baseUrl = "http://65.109.233.251:8080/";
  Duration durationTimeout = const Duration(seconds: 30);

  Future<HttpResult> post(String url, dynamic body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }

    final headers = getReqHeader();

    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: body,
            headers: headers,
          )
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: null,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -2,
        result: null,
      );
    }
  }

  Future<HttpResult> put(String url, dynamic body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }

    final headers = getReqHeader();

    try {
      http.Response response = await http
          .put(
            Uri.parse(url),
            body: body,
            headers: headers,
          )
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: null,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -2,
        result: null,
      );
    }
  }

  Future<HttpResult> get(String url) async {
    if (kDebugMode) {
      print(url);
    }

    final headers = getReqHeader();

    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: null,
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -2,
        result: null,
      );
    }
  }

  HttpResult result(http.Response response) {
    if (kDebugMode) {
      String data = response.body.length > 150
          ? response.body.substring(0, 150)
          : response.body;
      print(data);
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // print(response.body);
      return HttpResult(
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
        status: response.statusCode,
      );
    } else {
      try {
        return HttpResult(
          isSuccess: false,
          result: json.decode(utf8.decode(response.bodyBytes)),
          status: response.statusCode,
        );
      } catch (_) {
        return HttpResult(
          isSuccess: false,
          result: response.body,
          status: response.statusCode,
        );
      }
    }
  }

  Map<String, String> getReqHeader() {
    Map<String, String> data;
    data = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Credentials": true,
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE",
    };
    return data;
  }
}
