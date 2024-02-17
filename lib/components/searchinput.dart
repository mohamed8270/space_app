import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/constants/theme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.Controller,
  });

  final TextEditingController Controller;

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Container(
      height: ScreenSize.height * 0.055,
      width: ScreenSize.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: Controller,
        cursorColor: Sorange,
        cursorHeight: 15,
        cursorWidth: 2,
        style: GoogleFonts.poppins(
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
          color: Swhite,
        ),
        decoration: InputDecoration(
          labelText: 'Search Planets',
          border: InputBorder.none,
          labelStyle: GoogleFonts.poppins(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            color: Swhite.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Swhite.withOpacity(0.3),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Sorange,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
