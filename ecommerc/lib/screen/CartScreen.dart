import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cartmanager.dart';
import 'login.dart'; 

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cart = CartManager();

  void openWhatsApp(String phone, String message) async {
    final whatsappUrl = Uri.parse("https://wa.me/$phone?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('WhatsApp not open')),
      );
    }
  }

  void _handleCheckout() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      final message = StringBuffer();
      for (var item in cart.cartItems) {
        message.writeln("${item.product.name} x${item.quantity} - Rs ${item.product.price * item.quantity}");
      }
      message.writeln("\nTotal: Rs ${cart.totalPrice.toStringAsFixed(2)}");

      openWhatsApp('923412057527', "Hello, I want to order these items:\n\n$message");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cartItems = cart.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: theme.colorScheme.primary,
        elevation: 1,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.6)),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item.product.imageUrl,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.name,
                                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Rs ${item.product.price.toStringAsFixed(2)}',
                                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, color: theme.colorScheme.primary),
                                    onPressed: () {
                                      setState(() {
                                        cart.decreaseQuantity(item.product);
                                      });
                                    },
                                  ),
                                  Text(
                                    item.quantity.toString(),
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add, color: theme.colorScheme.primary),
                                    onPressed: () {
                                      setState(() {
                                        cart.addToCart(item.product);
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                                    onPressed: () {
                                      setState(() {
                                        cart.removeFromCart(item.product);
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rs ${cart.totalPrice.toStringAsFixed(2)}",
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 6,
                            shadowColor: theme.colorScheme.primary.withOpacity(0.4),
                          ),
                          onPressed: _handleCheckout,
                          child: Text(
                            "Checkout",
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
