// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:forum_app/model/auth_vm.dart';
import 'package:forum_app/views/login_page.dart';
import 'package:forum_app/views/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                'Register Page',
                style: GoogleFonts.poppins(fontSize: size * 0.080),
              ),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Email',
                controller: vm.email,
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Name',
                controller: vm.name,
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Username',
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
                  onPressed: () => {vm.register(context)},
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.040,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const LoginPage());
                  },
                  child: Text(
                    'Already have an account login',
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
