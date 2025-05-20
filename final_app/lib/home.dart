import 'package:final_app/catagory.dart';
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(
        title: Center(
          child: Text(
            "Electronic items App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Search for products...",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Catalog()),
                    );
                  },
                  child: const Text("See All"),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: electornicItem.length,

              itemBuilder: (context, index) {
                var categorySCR = electornicItem[index]["name"];
                var selectedSCR = itemList[categorySCR];

                var category = electornicItem[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => selectedSCR),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            category['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(category['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
