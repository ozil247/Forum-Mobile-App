import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key, required this.hintText, required this.controller, required this.obscureText,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:  Colors.grey[300],
        borderRadius: BorderRadius.circular(5)
      ),
      child:  TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20)
        ),
      ),
    );
  }
}