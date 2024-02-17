import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_app/components/navbar.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quantum Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const NavBar(),
    );
  }
}
