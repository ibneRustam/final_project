
import 'package:ecommerce/class/cartmanager.dart';
import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/CartScreen.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';

class airbuds extends StatefulWidget {
  const airbuds({super.key});

  @override
  State<airbuds> createState() => _AirbudsState();
}

class _AirbudsState extends State<airbuds> {
  final themeColor = Colors.green.shade300;

  List<Product> airpods = [
    Product(1, 'Airpods 1', 'Latest model with high performance', 12000, "assets/image/airbird1.webp"),
    Product(2, 'Airpods 2', 'Latest model with high performance', 12000, "assets/image/airbird2.webp"),
    Product(3, 'Airpods 3', 'Latest model with high performance', 12000, "assets/image/airbird3.webp"),
    Product(4, 'Airpods 4', 'Latest model with high performance', 12000, "assets/image/airbird4.webp"),
    Product(5, 'Airpods 5', 'Latest model with high performance', 12000, "assets/image/airbird5.webp"),
    Product(6, 'Airpods 6', 'Latest model with high performance', 12000, "assets/image/airbird6.webp"),
    Product(7, 'Airpods 7', 'Latest model with high performance', 12000, "assets/image/airbird7.webp"),
    Product(8, 'Airpods 8', 'Latest model with high performance', 12000, "assets/image/airbird8.webp"),
    Product(9, 'Airpods 9', 'Latest model with high performance', 12000, "assets/image/airbird9.webp"),
    Product(10, 'Airpods 10', 'Latest model with high performance', 12000, "assets/image/airbird10.webp"),
  ];
Set<int> favoriteIds = {};
  Set<int> disabledAddToCart = {};

  void addToCart(Product product) {
    CartManager().addToCart(product);
    setState(() {
      disabledAddToCart.add(product.id);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        disabledAddToCart.remove(product.id);
      });
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

  Widget buildRatingStars() => Row(
        children: List.generate(
          5,
          (index) => const Icon(Icons.star, color: Colors.amber, size: 14),
        ),
      );

  Widget buildActionButtons(Product product) => Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: disabledAddToCart.contains(product.id)
                  ? null
                  : () => addToCart(product),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: disabledAddToCart.contains(product.id)
                      ? LinearGradient(
                          colors: [Colors.grey.shade400, Colors.grey.shade300])
                      : const LinearGradient(
                          colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
                        ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    if (!disabledAddToCart.contains(product.id))
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.white, size: 13),
                    const SizedBox(width: 4),
                    Text(
                      disabledAddToCart.contains(product.id) ? "Added" : "Add to Cart",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetail(product: product),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: themeColor.withOpacity(0.25),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: Colors.white, size: 13),
                    SizedBox(width: 4),
                    Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 700 ? 3 : 2;
    final childAspectRatio = screenWidth > 700 ? 0.7 : 0.6;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text("Air pods",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: themeColor,
        elevation: 4,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                },
              ),
              if (CartManager().cartItems.isNotEmpty)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      CartManager().cartItems.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: airpods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (_, index) {
            final product = airpods[index];
            final isFavorite = favoriteIds.contains(product.id);

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: product.imageUrl,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                          child: Image.asset(
                            product.imageUrl,
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "On Sale",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => toggleFavorite(product.id),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        buildRatingStars(),
                        const SizedBox(height: 8),
                        Text(
                          "Rs ${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildActionButtons(product),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
