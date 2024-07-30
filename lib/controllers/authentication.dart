import 'dart:convert';

import 'package:forum_app/utilities/server.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  final isLoading = false.obs;

  get text => null;
  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var date = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      };
      var response = await http.post(Uri.parse('/register'),
          headers: {'Accept': 'application/json'}, body: date);

      if (response.statusCode == 201) {
        isLoading.value = false;
        print(json.decode(response.body));  
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
