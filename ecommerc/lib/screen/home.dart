import 'dart:async';
import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/accessories.dart';
import 'package:ecommerce/item/airbuds.dart';
import 'package:ecommerce/item/tablet.dart';
import 'package:ecommerce/item/smartwatch.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/item/laptop.dart';
import 'package:ecommerce/item/mobile.dart';

import 'package:ecommerce/screen/catlog.dart';
// import 'package:ecommerce/screen/detail.dart';



List<Product> homepage = [
  Product(
    1,
    'Mobile',
    'Latest model with high performance',
    12000.99,
    "assets/image/mbl1.webp",
  ),
  Product(
    2,
    'Laptop',
    'Slim and powerful laptop',
    55000.50,
    "assets/image/lap1.jpg",
  ),
  Product(
    3,
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    4,
    'Air buds',
    'Best sound Air buds',
    5999.00,
    "assets/image/airbird1.webp",
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final themeColor = Colors.green.shade300;
  int _currentBannerIndex = 0;
  late PageController _bannerController;
  late Timer _timer;

  final List<Map<String, String>> electronicItem = [
    {"name": "Mobiles", "image": "assets/image/mobileee.webp"},
    {"name": "Laptops", "image": "assets/image/laptops.jpg"},
    {"name": "Smart Watches", "image": "assets/image/smartwatch.jpg"},

    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
    {"name": "Air buds", "image": "assets/image/airbird3.webp"},
    {"name": "Accessories", "image": "assets/image/char1.jpg"},
  ];

  final Map<String, Widget> itemList = {
    "Mobiles": Mobiles(),
    "Laptops": laptops(),
    "Smart watch": smartWatches(),
    "Air buds": airbuds(),
    "Tablet": tablet(),
    "Accessories": Accessories(),
  };

  final List<String> bannerImages = [
    "assets/image/home1.jpg",
    "assets/image/home2.jpg",
    "assets/image/home3.jpg",
    "assets/image/home4.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _bannerController = PageController(viewportFraction: 0.9);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentBannerIndex < bannerImages.length - 1) {
        _currentBannerIndex++;
      } else {
        _currentBannerIndex = 0;
      }
      _bannerController.animateToPage(
        _currentBannerIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: const [
              Icon(Icons.flash_on, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                "Welcome to Tech Store!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 🔄 Auto Sliding Banner
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _bannerController,
              itemCount: bannerImages.length,
              itemBuilder:
                  (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(bannerImages[index]),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 8),
                      ],
                    ),
                  ),
            ),
          ),

          const SizedBox(height: 24),

          // 🔍 Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for gadgets...",
                prefixIcon: Icon(Icons.search, color: themeColor),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 🗂 Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Catalog()),
                    ),
                child: Text("See All", style: TextStyle(color: themeColor)),
              ),
            ],
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: electronicItem.length,
              itemBuilder: (_, index) {
                final item = electronicItem[index];
                final screen = itemList[item['name']];
                return GestureDetector(
                  onTap: () {
                    if (screen != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => screen),
                      );
                    }
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(item['image']!),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 28),

          const Text(
            "Recommended",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 12),

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homepage.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, index) {
              final product = homepage[index];
              return GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetail(product: product),
                      ),
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 6),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          product.imageUrl,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Rs ${product.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.w500,
                              ),
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
        ],
      ),
    );
  }
}

// class ProductDetail extends StatelessWidget {
//   final Product product;
//   const ProductDetail({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Colors.green.shade300;
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name), backgroundColor: themeColor),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Center(child: Image.asset(product.imageUrl, height: 200)),
//             const SizedBox(height: 16),
//             Text(
//               product.name,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(product.description),
//             const SizedBox(height: 8),
//             Text(
//               'Rs ${product.price.toStringAsFixed(2)}',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: themeColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: themeColor),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => CartScreen()),
//                   );
//                 },
//                 child: const Text("Add to Cart"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
