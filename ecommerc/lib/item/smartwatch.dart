import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/screen/productdetail.dart';

import 'package:flutter/material.dart';

class smartWatches extends StatefulWidget {
  const smartWatches({super.key});

  @override
  State<smartWatches> createState() => _smartWatchesState();
}

class _smartWatchesState extends State<smartWatches> {

  final themeColor = Colors.green.shade300;

  List<Product> smartwatch = [
    Product(
      1,
      'Smart Watch 1',
      'Latest model with high performance',
      12000,
      "assets/image/watch1.webp",
    ),
    Product(
      2,
      'Smart Watch 2',
      'Latest model with high performance',
      12000,
      "assets/image/watch2.webp",
    ),

    Product(
      3,
      'Smart Watch 3',
      'Latest model with high performance',
      12000,
      "assets/image/watch3.webp",
    ),


    Product(
      4,
      'Smart Watch 4',
      'Latest model with high performance',
      12000,
      "assets/image/watch4.webp",
    ),

    Product(
      5,
      'Smart Watch 5',
      'Latest model with high performance',
      12000,
      "assets/image/watch5.webp",
    ),

    Product(
      6,
      'Smart Watch 6',
      'Latest model with high performance',
      12000,
      "assets/image/watch6.webp",
    ),

    Product(
      7,
      'Smart Watch 7',
      'Latest model with high performance',
      12000,
      "assets/image/watch7.webp",
    ),

    Product(
      8,
      'Smart Watch 8',
      'Latest model with high performance',
      12000,
      "assets/image/watch8.webp",
    ),

    Product(
      9,
      'Smart Watch 9',
      'Latest model with high performance',
      12000,
      "assets/image/watch9.webp",
    ),

    Product(
      10,
      'Smart Watch 10',
      'Latest model with high performance',
      12000,
      "assets/image/watch10.webp",
    ),

    Product(
      11,
      'Smart Watch 11',
      'Latest model with high performance',
      12000,
      "assets/image/watch11.webp",
    ),

    Product(
      12,
      'Smart Watch 12',
      'Latest model with high performance',
      12000,
      "assets/image/watch12.webp",
    ),

    Product(
      13,
      'Smart Watch 13',
      'Latest model with high performance',
      12000,
      "assets/image/watch13.webp",
    ),

    Product(
      14,
      'Smart Watch 14',
      'Latest model with high performance',
      12000,
      "assets/image/watch14.webp",
    ),

Product(
      15,
      'Smart Watch 15',
      'Latest model with high performance',
      12000,
      "assets/image/watch15.webp",
    ),
  ];
List<Product> cartItems = [];
  Set<int> favoriteIds = {};

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        backgroundColor: themeColor,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void toggleFavorite(int id) {
    setState(() {
      if (favoriteIds.contains(id)) {
        favoriteIds.remove(id);
      } else {
        favoriteIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Mobiles"),
        centerTitle: true,
        backgroundColor: themeColor,
        elevation: 4,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartItems.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: smartwatch.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (_, index) {
            final product = smartwatch[index];
            final isFavorite = favoriteIds.contains(product.id);
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetail(product: product),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: product.imageUrl,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                        child: Image.asset(
                          product.imageUrl,
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.star : Icons.star_border,
                                  color: isFavorite ? Colors.orange : Colors.grey,
                                ),
                                onPressed: () => toggleFavorite(product.id),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Rs ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => addToCart(product),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themeColor,
                                padding: const EdgeInsets.all(10),
                                shape: const CircleBorder(),
                                elevation: 3,
                              ),
                              child: const Icon(Icons.add_shopping_cart, size: 20, color: Colors.white),
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
      ),
    );
  }
}