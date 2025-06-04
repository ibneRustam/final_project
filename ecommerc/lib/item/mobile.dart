import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/CartScreen.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/class/cartmanager.dart';

class Mobiles extends StatefulWidget {
  const Mobiles({super.key});

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  final themeColor = Colors.teal.shade600;

  List<Product> mobiles = List.generate(
    15,
    (i) => Product(
      i + 1,
      'Mobile ${i + 1}',
      'Latest model with high performance',
      12000,
      "assets/image/mbl${i + 1}.webp",
    ),
  );

 
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

  Widget buildRatingStars() {
    return Row(
      children: List.generate(
        5,
        (index) => const Icon(Icons.star, color: Colors.amber, size: 14),
      ),
    );
  }

  Widget buildActionButtons(Product product) {
    bool hoverAdd = false;
    bool hoverBuy = false;

    final addToCartButton = StatefulBuilder(
      builder: (context, innerSetState) {
        return MouseRegion(
          onEnter: (_) => innerSetState(() => hoverAdd = true),
          onExit: (_) => innerSetState(() => hoverAdd = false),
          child: GestureDetector(
            onTap: disabledAddToCart.contains(product.id) ? null : () => addToCart(product),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: disabledAddToCart.contains(product.id)
                    ? LinearGradient(colors: [Colors.grey.shade400, Colors.grey.shade300])
                    : const LinearGradient(colors: [Color(0xFFFF9800), Color(0xFFFF5722)]),
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
                  const Icon(Icons.add_shopping_cart_rounded, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    hoverAdd
                        ? (disabledAddToCart.contains(product.id) ? "Added" : "Add to Cart")
                        : "Cart",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    final buyNowButton = StatefulBuilder(
      builder: (context, innerSetState) {
        return MouseRegion(
          onEnter: (_) => innerSetState(() => hoverBuy = true),
          onExit: (_) => innerSetState(() => hoverBuy = false),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductDetail(product: product)),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    hoverBuy ? "Buy Now" : "Buy",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Always keep buttons in one row, no matter screen size
    return Row(
      children: [
        Expanded(child: addToCartButton),
        const SizedBox(width: 12),
        Expanded(child: buyNowButton),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobiles'),
        backgroundColor: themeColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mobiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          // Increase aspect ratio slightly to give image more height on small screens
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final product = mobiles[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(product.imageUrl, fit: BoxFit.cover, width: double.infinity),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Rs. ${product.price}", style: TextStyle(color: themeColor)),
                  const SizedBox(height: 4),
                  buildRatingStars(),
                  const SizedBox(height: 8),
                  buildActionButtons(product),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
