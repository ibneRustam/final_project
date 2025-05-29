
import 'package:ecommerce/item/accessories.dart';
import 'package:ecommerce/item/airbuds.dart';
import 'package:ecommerce/item/laptop.dart';
import 'package:ecommerce/item/mobile.dart';
import 'package:ecommerce/item/smartwatch.dart';
import 'package:ecommerce/item/tablet.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List electornicItem = [
    {"name": "Mobiles", "image": "assets/image/mobile.jpg"},
    {"name": "Laptops", "image": "assets/image/laptops.jpg"},
    {"name": "Smart Watches", "image": "assets/image/smartwatch.jpg"},
    {"name": "Airbuds", "image": "assets/image/airbird3.webp"},
    {"name": "Accessories", "image": "assets/image/charger.jpg"},
    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
  ];

  Map itemList = {
    "Mobiles": Mobiles(),
    "Laptops": laptops(),
    "Smart Watches": smartWatches(),
    "Airbuds": airbuds(),
    "Accessories": Accessories (),
    "Tablets": tablet(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Catagories"))),
      body: GridView.builder(
        itemCount: electornicItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var categorySCR = electornicItem[index]["name"];
          var selectedSCR = itemList[categorySCR];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => selectedSCR),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      electornicItem[index]["image"],
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(child: Text(electornicItem[index]["name"])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}