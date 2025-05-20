import 'package:flutter/material.dart';

class tablets extends StatefulWidget {
  const tablets({super.key});

  @override
  State<tablets> createState() => _tabletsState();
}

class _tabletsState extends State<tablets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("tablet Screen")));
  }
}
