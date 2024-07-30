import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forum_app/utilities/alert.dart';
import 'package:forum_app/utilities/getit.dart';
import 'package:forum_app/utilities/server.dart';
import 'package:forum_app/utilities/storage.dart';
import 'package:http/http.dart' as http;

class AuthVm extends ChangeNotifier {
  final storage = getIt.get<LocalStorageService>();

  final name = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  register(context) async {
    final loader = progressLoader(context);
    loader.show();

    final req = await Server().req(context, "/register", type: 'post', data: {
      'name': name.text,
      'email': email.text,
      'username': username.text,
      'password': password.text,
    });
    loader.dismiss();
    final res = json.decode(req.body);

    if (res['success'] == true) {
      successAlert(context, 'Account Created');
      getIt.get<LocalStorageService>().setString("token", res['token']);
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }

  login(context) async {
    final loader = progressLoader(context);
    loader.show();

    final req = await Server().req(context, "/login", type: 'post', data: {
      'username': username.text,
      'password': password.text,
    });
    loader.dismiss();
    final res = json.decode(req.body);

    if (res['success'] == true) {
      successAlert(context, 'Account Created');
      getIt.get<LocalStorageService>().setString("token", res['token']);
    } else {
      errorAlert(context, res['message']);
    }
    return;
  }
}
