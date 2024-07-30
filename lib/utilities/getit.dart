
import 'package:flutter/material.dart';
import 'package:forum_app/utilities/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;


Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => LocalStorageService(sharedPreferences));
}