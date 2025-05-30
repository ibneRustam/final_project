import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cartmanager.dart';

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
        const SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.green.shade300;
    final cartItems = cart.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: themeColor,
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.product.imageUrl, width: 50, height: 50),
                        title: Text(item.product.name),
                        subtitle: Text('Rs ${item.product.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  cart.decreaseQuantity(item.product);
                                });
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cart.addToCart(item.product);
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  cart.removeFromCart(item.product);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Rs ${cart.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeColor)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: themeColor),
                          onPressed: () {
                            
                            final message = StringBuffer();
                            for (var item in cartItems) {
                              message.writeln("${item.product.name} x${item.quantity} - Rs ${item.product.price * item.quantity}");
                            }
                            message.writeln("\nTotal: Rs ${cart.totalPrice.toStringAsFixed(2)}");

                            openWhatsApp(
                              '923412057527',
                              "Hello, I want to order these items:\n\n${message.toString()}",
                            );
                          },
                          child: const Text("Checkout"),
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
