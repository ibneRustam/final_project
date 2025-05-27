import 'package:flutter/material.dart';

class Smartwatch extends StatefulWidget {
  const Smartwatch({super.key});

  @override
  State<Smartwatch> createState() => _SmartwatchState();
}

class _SmartwatchState extends State<Smartwatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("smartwatch"));
  }
}