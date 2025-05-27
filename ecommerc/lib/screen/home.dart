import 'package:ecommerce/item/laptop.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/item/smartwatch.dart';
import 'package:ecommerce/screen/cart.dart';
import 'package:ecommerce/screen/catlog.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(this.name, this.description, this.price, this.imageUrl);
}

List<Product> dummyProducts = [
  Product(
    'Mobile',
    'Latest model with high performance',
    12000.99,
    "assets/image/mbl1.webp",
  ),
  Product(
    'Laptop',
    'Slim and powerful laptop',
    55000.50,
    "assets/image/lap1.jpg",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Air buds',
    'Best Sound providing Air buds ',
    5999.00,
    "assets/image/airbird1.webp",
  ),
  Product(
    'Camera',
    'Slim and powerful Camera',
    4999.99,
    "assets/image/cam1.jpg",
  ),
  Product('Charger', '65 W fast Charger', 1200.00, "assets/image/charger.jpg"),
  Product(
    'Console',
    'console with fitness tracking',
    12000.00,
    "assets/image/console.jpg",
  ),
  Product(
    'Smart Watch',
    'Slim and powerful laptop',
    100000,
    "assets/image/lap3.jpg",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
  Product(
    'Smart Watch',
    'Smartwatch with fitness tracking',
    4999.99,
    "assets/image/watch1.webp",
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> electronicItem = [
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
    "Mobiles": const Mobile(),
    "Laptops": const Laptop(),
    "Smart Watches": const Smartwatch(),
    // باقی آئٹمز کے لیے ویجیٹ یہاں ڈال سکتے ہیں
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
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: bannerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          bannerImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for gadgets...",
                  prefixIcon: Icon(Icons.search, color: themeColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onChanged: (value) {},
              ),
            ),

            const SizedBox(height: 32),

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
                      MaterialPageRoute(builder: (_) => const Catalog()),
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

            // Categories Carousel
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: electronicItem.length,
                itemBuilder: (context, index) {
                  final category = electronicItem[index];
                  final screen = itemList[category['name']];
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
                      width: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Products List
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) {
                  final product = dummyProducts[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.name),
                      subtitle: Text("Rs: ${product.price.toStringAsFixed(2)}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetail(product: product),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(product.imageUrl, height: 150)),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 8),
            Text(
              'Rs ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
