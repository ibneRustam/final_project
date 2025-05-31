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

  final List<Map<String, String>> electronicItem = [
    {"name": "Mobiles", "image": "assets/image/mobileee.webp"},
    {"name": "Laptops", "image": "assets/image/lap1.jpg"},
    {"name": "Smart Watches", "image": "assets/image/watch1.webp"},
    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
    {"name": "Air buds", "image": "assets/image/airbird3.webp"},
    {"name": "Accessories", "image": "assets/image/acc1.jpg"},
  ];

  final Map<String, Widget> itemList = {
    "Mobiles": Mobiles(),
    "Laptops": Laptops(),
    "Smart Watches": smartWatches(),
    "Tablets": tablet(),
    "Air buds": airbuds(),
    "Accessories": Accessories(),
  };

  final List<String> bannerImages = [
    "assets/image/home1.jpg",
    "assets/image/home2.jpg",
    "assets/image/home3.jpg",
    "assets/image/home4.jpg",
  ];

  final List<Product> homepage = [
    Product(1, 'Mobile', 'Latest model with high performance', 12000.99, "assets/image/mbl1.webp"),
    Product(2, 'Laptop', 'Slim and powerful laptop', 55000.50, "assets/image/lap1.jpg"),
    Product(3, 'Smart Watch', 'Smartwatch with fitness tracking', 4999.99, "assets/image/watch1.webp"),
    Product(4, 'Air buds', 'Best sound Air buds', 5999.00, "assets/image/airbird1.webp"),
  ];

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Welcome Text with reduced vertical padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.flash_on, color: Color.fromARGB(255, 47, 105, 60)),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    "Welcome to M. Mart!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),

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
                child: Text("See All", style: TextStyle(color: themeColor)),
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
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (screen != null) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
          }
        },
        child: Container(
          width: isTablet ? 120 : 100,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [themeColor.withOpacity(0.8), themeColor.withOpacity(0.3)],
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: isTablet ? 80 : 60,
                height: isTablet ? 80 : 60,
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item['name']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
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

          // Recommended Products
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homepage.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (_, index) {
              final product = homepage[index];
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
                      // Product Image
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
                      // Product Name
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
                      // Product Description with less padding
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          product.description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Price with Rs: prefix and less padding
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
