

import 'package:flutter/material.dart';

class cameras extends StatefulWidget {
  const cameras({super.key});

  @override
  State<cameras> createState() => _camerasState();
}

class _camerasState extends State<cameras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("camera Screen")));
  }
}