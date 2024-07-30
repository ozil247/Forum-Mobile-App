import 'package:flutter/material.dart';
import 'package:forum_app/model/auth_vm.dart';
import 'package:forum_app/utilities/getit.dart';
import 'package:forum_app/views/login_page.dart';
import 'package:forum_app/views/register_page.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() async{
  await setup();
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider( create: (_) => AuthVm(),)
      
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forum',
      home: RegisterPage(),
    );
  }
}
