import 'package:final_app/class/model.dart';
import 'package:final_app/item/mobile.dart';

import 'package:flutter/material.dart';

class laptops extends StatefulWidget {
  const laptops({super.key});

  @override
  State<laptops> createState() => _laptopsState();
}

class _laptopsState extends State<laptops> {
  List<catagory_model> laptops = [
    catagory_model(
      id: "1",
      image: "assets/image/lap1.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "2",
      image: "assets/image/lap2.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "3",
      image: "assets/image/lap3.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "4",
      image: "assets/image/lap1.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "5",
      image: "assets/image/lap2.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "3",
      image: "assets/image/lap3.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
    catagory_model(
      id: "7",
      image: "assets/image/lap1.jpg",
      name: "HP laptop",
      price: "100000",
      rate: "rate",
      isfav: "isfav",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Laptops"))),
      body: GridView.builder(
        itemCount: laptops.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => detailSCR()),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      laptops[index].image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text((laptops[index].name)),
                        Text((laptops[index].price)),
                        Center(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.star),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite),
                              ),
                            ],
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