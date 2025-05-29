import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/laptop.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class tablet extends StatefulWidget {
  const tablet({super.key});

  @override
  State<tablet> createState() => _tabletState();
}

class _tabletState extends State<tablet> {
  final themeColor = Colors.green.shade300;

  List<Product> tablet = [
    Product(
      1,
      'Tablet 1',
      'Latest model with high performance',
      12000,
      "assets/image/tab1.jpg",
    ),

    Product(
      2,
      'Tablet 2',
      'Latest model with high performance',
      12000,
      "assets/image/tab2.jpg",
    ),

    Product(
      3,
      'Tablet 3',
      'Latest model with high performance',
      12000,
      "assets/image/tab3.jpg",
    ),

    Product(
      4,
      'Tablet 4',
      'Latest model with high performance',
      12000,
      "assets/image/tab4.jpg",
    ),

    Product(
      5,
      'Tablet 5',
      'Latest model with high performance',
      12000,
      "assets/image/tab5.jpg",
    ),

    Product(
      6,
      'Tablet 6',
      'Latest model with high performance',
      12000,
      "assets/image/tab6.jpg",
    ),
    Product(
      7,
      'Tablet 7',
      'Latest model with high performance',
      12000,
      "assets/image/tab7.jpg",
    ),
    Product(
      8,
      'Tablet 8',
      'Latest model with high performance',
      12000,
      "assets/image/tab8.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Mobile"))),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tablet.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, index) {
          final product = tablet[index];
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
