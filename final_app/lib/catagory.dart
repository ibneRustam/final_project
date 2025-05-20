import 'package:final_app/catogory/airbuds.dart';
import 'package:final_app/catogory/cameras.dart';
import 'package:final_app/catogory/chargers.dart';
import 'package:final_app/catogory/consoles.dart';
import 'package:final_app/catogory/earphones.dart';
import 'package:final_app/catogory/laptops.dart';
import 'package:final_app/catogory/mobile.dart';
import 'package:final_app/catogory/powerbank.dart';
import 'package:final_app/catogory/smartwatches.dart';
import 'package:final_app/catogory/tablets.dart';
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
    {"name": "Cameras", "image": "assets/image/camera.jpg"},
    {"name": "Consoles", "image": "assets/image/console.jpg"},
    {"name": "Earphones", "image": "assets/image/earphone.jpg"},
    {"name": "Airbuds", "image": "assets/image/airbuds.jpg"},
    {"name": "Chargers", "image": "assets/image/charger.jpg"},
    {"name": "Tablets", "image": "assets/image/tablet.jpg"},
    {"name": "Powerbanks", "image": "assets/image/powerbank.jpg"},
  ];

  Map itemList = {
    "Mobiles": mobiles(),
    "Laptops": laptops(),
    "Smart Watches": smartWatches(),
    "Cameras": cameras(),
    "Consoles": consoles(),
    "Earphones": earphones(),
    "Airbuds": airbuds(),
    "Chargers": chargers(),
    "Tablets": tablets(),
    "Powerbanks": powerbanks(),
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
