import 'dart:async';

import 'package:final_app/Favorites.dart';
import 'package:final_app/cart.dart';
import 'package:final_app/catagory.dart';
import 'package:final_app/home.dart';
import 'package:final_app/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'final Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TabbarScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/image/laptop.jpg")),
    );
  }
}

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Electronic App")),
          bottom: TabBar(
            tabs: [
              Tab(child: Text(" Home")),
              Tab(child: Text("Catalog")),
              Tab(child: Text("Cart")),
              Tab(child: Text("Favorites")),
              Tab(child: Text("Profile")),
            ],
          ),
        ),

        body: TabBarView(
          children: [Home(), Catalog(), Cart(), Favorites(), Profile()],
        ),
      ),
    );
  }
}


