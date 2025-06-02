import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/CartScreen.dart';
import 'package:ecommerce/class/cartmanager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;
  bool isDescriptionExpanded = false;
  bool isFavorited = false;

  void _addToCart(BuildContext context) {
    CartManager().addToCart(widget.product, quantity: quantity);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} (x$quantity) added to cart 🛒'),
        backgroundColor: Colors.teal.shade600,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF26A69A); // Teal 400
    final themeGradient = [const Color(0xFF26A69A), const Color(0xFF00796B)];
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: themeColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation for image
            Hero(
              tag: widget.product.id,
              child: Container(
                width: double.infinity,
                height: isLargeScreen ? size.height * 0.5 : size.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              widget.product.name,
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star, color: Colors.amber, size: 20),
                Icon(Icons.star_half, color: Colors.amber, size: 20),
                Icon(Icons.star_border, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                Text('3.5 (24 reviews)', style: GoogleFonts.poppins()),
              ],
            ),

            const SizedBox(height: 16),

            AnimatedCrossFade(
              firstChild: Text(
                widget.product.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
              ),
              secondChild: Text(
                widget.product.description,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
              ),
              crossFadeState: isDescriptionExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isDescriptionExpanded = !isDescriptionExpanded;
                });
              },
              child: Text(
                isDescriptionExpanded ? 'Read less' : 'Read more',
                style: GoogleFonts.poppins(color: themeColor),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Rs. ${(widget.product.price * quantity).toStringAsFixed(0)}",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Text('Quantity:', style: GoogleFonts.poppins(fontSize: 16)),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: themeColor),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                        color: themeColor,
                      ),
                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                        color: themeColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom Sticky Button
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          width: isLargeScreen ? 500 : double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _addToCart(context),
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            label: Text(
              'Add $quantity to Cart - Rs. ${(widget.product.price * quantity).toStringAsFixed(0)}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
