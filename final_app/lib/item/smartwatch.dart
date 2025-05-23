import 'package:final_app/class/model.dart';
import 'package:final_app/item/mobile.dart';

import 'package:flutter/material.dart';

class smartWatches extends StatefulWidget {
  const smartWatches({super.key});

  @override
  State<smartWatches> createState() => _smartWatchesState();
}

class _smartWatchesState extends State<smartWatches> {
  List<catagory_model> smartWatches = [
    catagory_model(
      id: "1",
      image: "assets/image/watch1.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "2",
      image: "assets/image/watch2.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "3",
      image: "assets/image/watch3.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "4",
      image: "assets/image/watch4.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "5",
      image: "assets/image/watch5.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "6",
      image: "assets/image/watch6.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "7",
      image: "assets/image/watch7.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "8",
      image: "assets/image/watch8.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "9",
      image: "assets/image/watch9.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "10",
      image: "assets/image/watch10.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "11",
      image: "assets/image/watch11.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "12",
      image: "assets/image/watch12.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "13",
      image: "assets/image/watch13.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "14",
      image: "assets/image/watch14.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "15",
      image: "assets/image/watch15.webp",
      name: "Smart Watch 1",
      price: "25000",
      rate: "rate",
      isfav: "isfav",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Smart Watch"))),
      body: GridView.builder(
        itemCount: smartWatches.length,
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
                      smartWatches[index].image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text((smartWatches[index].name)),
                        Text((smartWatches[index].price)),
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
