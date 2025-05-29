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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Smart Watch"))),
      body: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: smartwatch.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, index) {
              final product = smartwatch[index];
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
        
      );
  }
}