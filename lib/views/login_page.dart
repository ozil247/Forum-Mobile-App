// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:forum_app/model/auth_vm.dart';
import 'package:forum_app/views/register_page.dart';
import 'package:forum_app/views/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVm>(context);

    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: GoogleFonts.poppins(fontSize: size * 0.080),
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Email',
                controller: vm.username,
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Password',
                controller: vm.password,
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    vm.register(context);
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.040,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const RegisterPage());
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.040,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
