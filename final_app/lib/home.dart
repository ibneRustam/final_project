import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_app/item/camera.dart';
import 'package:final_app/item/laptop.dart';
import 'package:final_app/item/mobile.dart';
import 'package:final_app/item/smartwatch.dart';
import 'package:flutter/material.dart';
import 'package:final_app/catagory.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> electornicItem = [
    {"name": "Mobiles", "image": "assets/image/mobileee.webp"},
    {"name": "Laptops", "image": "assets/image/laptops.jpg"},
    {"name": "Smart Watches", "image": "assets/image/smartwatch.jpg"},
    {"name": "Cameras", "image": "assets/image/camera.jpg"},
    {"name": "Consoles", "image": "assets/image/console.jpg"},
    {"name": "Earphones", "image": "assets/image/earphone.jpg"},
    {"name": "Airbuds", "image": "assets/image/airbuds.jpg"},
    {"name": "Chargers", "image": "assets/image/charger.jpg"},
    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
    {"name": "Powerbanks", "image": "assets/image/powerbank.jpg"},
  ];

  final Map<String, Widget> itemList = {
    "Mobiles": Mobiles(),
    "Laptops": laptops(),
    "Smart Watches": smartWatches(),
    "Cameras": cameras(),
    // "Consoles": consoles(),
    // "Earphones": earphones(),
    // "Airbuds": airbuds(),
    // "Chargers": chargers(),
    // "Tablets": tablets(),
    // "Powerbanks": powerbanks(),
  };

  final List<String> bannerImages = [
    "assets/image/home1.jpg",
    "assets/image/home2.jpg",
    "assets/image/home3.jpg",
    "assets/image/home4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.green.shade300;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 4,
        title: const Text(
          "Electronic Items",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 Welcome Header
            Row(
              children: const [
                Icon(Icons.flash_on, color: Colors.orange, size: 28),
                SizedBox(width: 8),
                Text(
                  "Welcome to Tech Store!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // 🖼️ Carousel Banner
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 0.9,
              ),
              items:
                  bannerImages.map((imagePath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 24),

            // 🔍 Search Box
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for gadgets...",
                  prefixIcon: Icon(Icons.search, color: themeColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 📂 Categories Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Catalog()),
                    );
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 📱 Category Auto-Play Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 0.45,
              ),
              items:
                  electornicItem.map((category) {
                    final screen = itemList[category['name']];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => screen!),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(category['image']!),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category['name']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


