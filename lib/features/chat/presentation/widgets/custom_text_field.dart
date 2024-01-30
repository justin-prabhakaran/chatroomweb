import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/colors.dart';

class CustomTextField extends StatelessWidget {
  final String title;

  const CustomTextField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: GoogleFonts.poppins(
            color: Colors.white60, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            fillColor: AppColor.blue,
            filled: true,
            hintText: title,
            hintStyle: GoogleFonts.poppins(
                color: Colors.white60, fontWeight: FontWeight.normal),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
    );
  }
}
