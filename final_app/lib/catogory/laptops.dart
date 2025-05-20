import 'package:flutter/material.dart';

class laptops extends StatefulWidget {
  const laptops({super.key});

  @override
  State<laptops> createState() => _laptopsState();
}

class _laptopsState extends State<laptops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("laptop Screen")));
  }
}