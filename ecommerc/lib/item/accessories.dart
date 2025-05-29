import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';

class Accessories extends StatefulWidget {
  const Accessories({super.key});

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  final themeColor = Colors.green.shade300;

  List<Product> accessories = [
    Product(
      1,
      'Charger 1',
      'Latest model with high performance',
      12000,
      "assets/image/acc1.jpg",
    ),
    Product(
      2,
      'Charger 2',
      'Latest model with high performance',
      12000,
      "assets/image/acc2.jpg",
    ),
    Product(
      3,
      'Charger 3',
      'Latest model with high performance',
      12000,
      "assets/image/acc3.jpg",
    ),
    Product(
      4,
      'Charger 4',
      'Latest model with high performance',
      12000,
      "assets/image/acc4.jpg",
    ),
    Product(
      5,
      'Charger 5',
      'Latest model with high performance',
      12000,
      "assets/image/acc5.jpg",
    ),
    Product(
      6,
      'Charger 6',
      'Latest model with high performance',
      12000,
      "assets/image/acc6.jpg",
    ),
    
    Product(
      7,
      'Charger 7',
      'Latest model with high performance',
      12000,
      "assets/image/acc7.jpg",
    ),
    Product(
      8,
      'Charger 8',
      'Latest model with high performance',
      12000,
      "assets/image/acc8.jpg",
    ),

  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Mobile"))),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: accessories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, index) {
          final product = accessories[index];
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
