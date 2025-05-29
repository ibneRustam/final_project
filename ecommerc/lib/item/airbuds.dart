import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';

class airbuds extends StatefulWidget {
  const airbuds({super.key});

  @override
  State<airbuds> createState() => _airbudsState();
}

class _airbudsState extends State<airbuds> {
  final themeColor = Colors.green.shade300;

  List<Product> airpods = [
    Product(
      1,
      'Airpods 1',
      'Latest model with high performance',
      12000,
      "assets/image/airbird1.webp",
    ),

    Product(
      2,
      'Airpods 2',
      'Latest model with high performance',
      12000,
      "assets/image/airbird2.webp",
    ),

    Product(
      3,
      'Airpods 3',
      'Latest model with high performance',
      12000,
      "assets/image/airbird3.webp",
    ),

    Product(
      4,
      'Airpods 4',
      'Latest model with high performance',
      12000,
      "assets/image/airbird4.webp",
    ),

    Product(
      5,
      'Airpods 5',
      'Latest model with high performance',
      12000,
      "assets/image/airbird5.webp",
    ),

    Product(
      6,
      'Airpods 6',
      'Latest model with high performance',
      12000,
      "assets/image/airbird6.webp",
    ),

    Product(
      7,
      'Airpods 7',
      'Latest model with high performance',
      12000,
      "assets/image/airbird7.webp",
    ),

    Product(
      8,
      'Airpods 8',
      'Latest model with high performance',
      12000,
      "assets/image/airbird8.webp",
    ),

    Product(
      9,
      'Airpods 9',
      'Latest model with high performance',
      12000,
      "assets/image/airbird9.webp",
    ),
    Product(
      10,
      'Airpods 10',
      'Latest model with high performance',
      12000,
      "assets/image/airbird10.webp",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Air pods"))),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: airpods.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (_, index) {
          final product = airpods[index];
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
