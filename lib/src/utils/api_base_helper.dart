import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

const String _dev = 'https://raw.githubusercontent.com';

class ApiBaseHelper {
  final String _baseUrl = _dev;

  Future<dynamic> get(String endpoint, String? otherurl) async {
    http.Response response;

    try {
      var url = Uri.parse(otherurl ?? '$_baseUrl$endpoint');
      response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });

      return response;
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
  }

  Future<dynamic> post(String endpoint, String body) async {
    http.Response response;

    try {
      var url = Uri.parse('$_baseUrl$endpoint');

      response = await http
          .post(
        url,
        headers: {
        "Content-Type": "application/json",
      },
        body: body,
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw TimeoutException('post timeout exceeded');
      });

      return response;
    } on SocketException {
      throw http.Response;
    }
  }

  Future<dynamic> put(String endpoint, String body) async {
    http.Response response;

    try {
      var url = Uri.parse('$_baseUrl$endpoint');

      response = await http
          .put(
        url,
        headers: {
        "Content-Type": "application/json",
      },
        body: body,
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw TimeoutException('put timeout exceeded');
      });

      return response;
    } on SocketException {
      throw http.ClientException;
    }
  }

  Future<dynamic> delete(String endpoint) async {
    http.Response response;

    try {
      var url = Uri.parse('$_baseUrl$endpoint');

      response = await http.delete(
        url,
        headers: {
        "Content-Type": "application/json",
      },
      ).timeout(const Duration(seconds: 120), onTimeout: () {
        throw TimeoutException('put timeout exceeded');
      });

      return response;
    } on SocketException {
      throw http.ClientException;
    }
  }
}
