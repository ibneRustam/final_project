
import 'package:final_app/item/camera.dart';
import 'package:final_app/item/laptop.dart';
import 'package:final_app/item/mobile.dart';
import 'package:final_app/item/smartwatch.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List electornicItem = [
    {"name": "Mobiles", "image": "assets/image/mobileee.webp"},
    {"name": "Laptops", "image": "assets/image/laptops.jpg"},
    {"name": "Smart Watches", "image": "assets/image/smartwatch.jpg"},
    {"name": "Cameras", "image": "assets/image/camera.jpg"},
    {"name": "Consoles", "image": "assets/image/console.jpg"},
    {"name": "Earphones", "image": "assets/image/earphone.jpg"},
    {"name": "Airbuds", "image": "assets/image/airbuds.jpg"},
    {"name": "Chargers", "image": "assets/image/charger.jpg"},
    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
    {"name": "Powerbanks", "image": "assets/image/powerbank.jpg"},
  ];

  Map itemList = {
    "Mobiles": Mobiles(),
    "Laptops": laptops(),
    "Smart Watches": smartWatches(),
    "Cameras": cameras(),
    // "Consoles": consoles(),
    // "Earphones": earphones(),
    // "Airbuds": airbuds(),
    // "Chargers": chargers(),
    // "Tablets": tablets(),
    // "Powerbanks": powerbanks(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Catagory"))),
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
