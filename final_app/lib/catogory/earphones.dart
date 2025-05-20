import 'package:flutter/material.dart';

class earphones extends StatefulWidget {
  const earphones({super.key});

  @override
  State<earphones> createState() => _earphonesState();
}

class _earphonesState extends State<earphones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("earphones Screen")));
  }
}