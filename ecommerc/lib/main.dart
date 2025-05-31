import 'dart:async';
import 'dart:ui' show ImageFilter;
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/screen/catlog.dart';
import 'package:ecommerce/screen/home.dart';
import 'package:ecommerce/screen/login.dart';
import 'package:ecommerce/screen/profiledetail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color mainColor1 = Color(0xff134e5e);
  static const Color mainColor2 = Color(0xff71b280);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MuftiMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor1),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
      ),
      home: const SplashScreen(),
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
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TabbarScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff134e5e), Color(0xff71b280)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "MuftiMart",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Trusted. Halal. Convenient.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  bool get _isUserLoggedIn => FirebaseAuth.instance.currentUser != null;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    _pages = [
      const HomeScreen(),
      const Catalog(),
      const Card(),
      _isUserLoggedIn ? const Profiledetail() : const LoginScreen(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 3) {
        _pages[3] = _isUserLoggedIn ? const Profiledetail() : const LoginScreen();
      }
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gradientColors = [Color(0xff134e5e), Color.fromARGB(255, 112, 177, 127)];

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("MuftiMart"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              backgroundColor: Colors.white.withOpacity(0.85),
              selectedItemColor: Color(0xff134e5e),
              unselectedItemColor: Colors.grey.shade600,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 11,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 26),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined, size: 26),
                  label: 'Catalog',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined, size: 26),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 26),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
