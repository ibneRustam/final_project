import 'package:flutter/material.dart';

class consoles extends StatefulWidget {
  const consoles({super.key});

  @override
  State<consoles> createState() => _consolesState();
}

class _consolesState extends State<consoles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("consoles Screen")));
  }
}