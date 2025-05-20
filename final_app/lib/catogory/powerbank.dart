import 'package:flutter/material.dart';

class powerbanks extends StatefulWidget {
  const powerbanks({super.key});

  @override
  State<powerbanks> createState() => _powerbanksState();
}

class _powerbanksState extends State<powerbanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Power bank Screen")));
  }
}