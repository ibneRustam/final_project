import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/accessories.dart';
import 'package:ecommerce/item/airbuds.dart';
import 'package:ecommerce/item/laptop.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/item/smartwatch.dart';
import 'package:ecommerce/item/tablet.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:ecommerce/screen/catlog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final themeColor = Colors.green.shade300;
  int _currentBannerIndex = 0;
  late PageController _bannerController;
  late ScrollController _categoryScrollController;
  late Timer _bannerTimer;
  late Timer _categoryScrollTimer;

  final List<Map<String, dynamic>> electronicItem = [
    {"name": "Mobiles", "icon": Icons.phone_android},
    {"name": "Laptops", "icon": Icons.laptop_mac},
    {"name": "Smart Watches", "icon": Icons.watch},
    {"name": "Tablets", "icon": Icons.tablet_mac},
    {"name": "Air buds", "icon": Icons.headphones},
    {"name": "Accessories", "icon": Icons.cable},
  ];

  final Map<String, Widget> itemList = {
    "Mobiles": Mobiles(),
    "Laptops": Laptops(),
    "Smart Watches": smartwatch(),
    "Tablets": Tablet(),
    "Air buds": airbuds(),
    "Accessories": Accessories(),
  };

  final List<String> bannerImages = [
    "assets/image/home1.jpg",
    "assets/image/home2.jpg",
    "assets/image/home3.jpg",
    "assets/image/home4.jpg",
  ];

  final List<Product> allProducts = [
    Product(1, 'Mobile', 'Latest model with high performance', 12000.99, "assets/image/mbl1.webp"),
    Product(2, 'Laptop', 'Slim and powerful laptop', 55000.50, "assets/image/lap1.jpg"),
    Product(3, 'Smart Watch', 'Smartwatch with fitness tracking', 4999.99, "assets/image/watch1.webp"),
    Product(4, 'Air buds', 'Best sound Air buds', 5999.00, "assets/image/airbird1.webp"),
  ];

  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(allProducts);
    _bannerController = PageController(viewportFraction: 0.9);
    _categoryScrollController = ScrollController();

    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentBannerIndex = (_currentBannerIndex + 1) % bannerImages.length;
      _bannerController.animateToPage(
        _currentBannerIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });

    _categoryScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_categoryScrollController.hasClients) {
        double maxScroll = _categoryScrollController.position.maxScrollExtent;
        double nextOffset = _categoryScrollController.offset + 120;

        _categoryScrollController.animateTo(
          nextOffset > maxScroll ? 0 : nextOffset,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _bannerTimer.cancel();
    _categoryScrollTimer.cancel();
    _bannerController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  void filterProducts(String query) {
    final results = allProducts.where((product) {
      final name = product.name.toLowerCase();
      final desc = product.description.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input) || desc.contains(input);
    }).toList();

    setState(() {
      displayedProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
        
        

          const SizedBox(height: 12),

          // Banner Slider
          SizedBox(
            height: screenWidth * 0.5,
            child: PageView.builder(
              controller: _bannerController,
              itemCount: bannerImages.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(bannerImages[index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: TextField(
              onChanged: filterProducts,
              decoration: InputDecoration(
                hintText: "Search for gadgets...",
                prefixIcon: Icon(Icons.search, color: themeColor),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Categories Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Catalog())),
                child: Text("See All", style: TextStyle(color: Colors.teal.shade600)),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Auto-Scrolling Categories
          SizedBox(
            height: isTablet ? 160 : 130,
            child: ListView.builder(
              controller: _categoryScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: electronicItem.length,
              itemBuilder: (_, index) {
                final item = electronicItem[index];
                final screen = itemList[item['name']];
                return InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (screen != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
                    }
                  },
                  child: Container(
                    width: isTablet ? 120 : 100,
                    height: isTablet ? 120 : 100,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.teal.shade600, Colors.teal.shade300],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item['icon'],
                          size: isTablet ? 40 : 30,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 28),
          const Text("Recommended", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 12),

          // Filtered Products Grid
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: displayedProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (_, index) {
              final product = displayedProducts[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetail(product: product)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        child: Image.asset(
                          product.imageUrl,
                          height: isTablet ? 180 : 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          product.description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rs: ${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: isTablet ? 14 : 12,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}