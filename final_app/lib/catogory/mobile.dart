import 'package:flutter/material.dart';

class mobiles extends StatefulWidget {
  const mobiles({super.key});

  @override
  State<mobiles> createState() => _mobilesState();
}

class _mobilesState extends State<mobiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Mobile Screen")));
  }
}
