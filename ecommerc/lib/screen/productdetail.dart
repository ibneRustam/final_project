import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/CartScreen.dart';
import 'package:ecommerce/screen/cartmanager.dart';
 // Make sure correct file
import 'package:flutter/material.dart';
import 'package:ecommerce/screen/home.dart'; // for Product model

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  void _addToCart(BuildContext context) {
    CartManager().addToCart(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.green.shade300;

    return Scaffold(
      appBar: AppBar(title: Text(product.name), backgroundColor: themeColor),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(product.imageUrl, height: 200)),
            const SizedBox(height: 16),
            Text(product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Rs ${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    color: themeColor,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: themeColor),
                onPressed: () => _addToCart(context), 
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}