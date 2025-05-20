import 'package:flutter/material.dart';

class chargers extends StatefulWidget {
  const chargers({super.key});

  @override
  State<chargers> createState() => _chargersState();
}

class _chargersState extends State<chargers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("charger Screen")));
  }
}
