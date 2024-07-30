// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:forum_app/utilities/alert.dart';
import 'package:forum_app/utilities/getit.dart';
import 'package:forum_app/utilities/storage.dart';
import 'package:forum_app/views/login_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Server {
  final _url = 'http://127.0.0.1:8000/api';

  String? token;

  _getToken() async {
    token = getIt.get<LocalStorageService>().getString("token");
  }

  req(context, apiUrl, {String? type = 'get', data}) async {
    var fullUrl = _url + apiUrl;
    var response;
    try { 
      await _getToken();
      print(token);
      if (type == 'post') {
        response = await http.post(Uri.parse(fullUrl),
            body: jsonEncode(data), headers: _setHeaders());
      } else {
        response = await http.get(Uri.parse(fullUrl), headers: _setHeaders());
      }

      if (response.statusCode == 401) {
        errorAlert(context, 'Session expired');
        await Get.offAll(() => LoginPage());
        await Future.delayed(Duration(seconds: 2));
      } else if (response.statusCode == 500) {
        errorAlert(context, 'An error occured, please try again');
        print(response.body);
      }
    } on SocketException {
      // await Get.offAll(() => NetworkError());
      errorAlert(context, 'No internet connection');
      await Future.delayed(Duration(seconds: 3));
    }
    return response;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
