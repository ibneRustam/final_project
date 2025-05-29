import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/home.dart';
import 'package:ecommerce/screen/productdetail.dart';
import 'package:flutter/material.dart';

class Mobiles extends StatefulWidget {
  const Mobiles({super.key});

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {

  final themeColor = Colors.green.shade300;

  List<Product> mobiles = [
    Product(
      1,
      'Mobile 1',
      'Latest model with high performance',
      12000,
      "assets/image/mbl1.webp",
    ),

    Product(
      2,
      'Mobile 2',
      'Latest model with high performance',
      12000,
      "assets/image/mbl2.webp",
    ),

    Product(
      3,
      'Mobile 3',
      'Latest model with high performance',
      12000,
      "assets/image/mbl3.webp",
    ),


    Product(
      4,
      'Mobile 4',
      'Latest model with high performance',
      12000,
      "assets/image/mbl4.webp",
    ),

    Product(
      5,
      'Mobile 5',
      'Latest model with high performance',
      12000,
      "assets/image/mbl5.webp",
    ),


    Product(
      6,
      'Mobile 6',
      'Latest model with high performance',
      12000,
      "assets/image/mbl6.webp",
    ),

    Product(
      7,
      'Mobile 7',
      'Latest model with high performance',
      12000,
      "assets/image/mbl7.webp",
    ),

    Product(
      8,
      'Mobile 8',
      'Latest model with high performance',
      12000,
      "assets/image/mbl8.webp",
    ),

    Product(
      9,
      'Mobile 9',
      'Latest model with high performance',
      12000,
      "assets/image/mbl9.webp",
    ),

    Product(
      10,
      'Mobile 10',
      'Latest model with high performance',
      12000,
      "assets/image/mbl10.webp",
    ),

    Product(
      11,
      'Mobile 11',
      'Latest model with high performance',
      12000,
      "assets/image/mbl11.webp",
    ),

    Product(
      12,
      'Mobile 12',
      'Latest model with high performance',
      12000,
      "assets/image/mbl12.webp",
    ),

    Product(
      13,
      'Mobile 13',
      'Latest model with high performance',
      12000,
      "assets/image/mbl13.webp",
    ),

    Product(
      14,
      'Mobile 14',
      'Latest model with high performance',
      12000,
      "assets/image/mbl14.webp",
    ),

    Product(
      15,
      'Mobile 15',
      'Latest model with high performance',
      12000,
      "assets/image/mbl15.webp",
    ),

  ];
  


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Center(child: Text("Mobile"))),
      body: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: mobiles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, index) {
              final product = mobiles[index];
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