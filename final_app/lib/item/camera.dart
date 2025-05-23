import 'package:final_app/class/model.dart';
import 'package:final_app/item/mobile.dart';

import 'package:flutter/material.dart';

class cameras extends StatefulWidget {
  const cameras({super.key});

  @override
  State<cameras> createState() => _camerasState();
}

class _camerasState extends State<cameras> {
  List<catagory_model> cameras = [
    catagory_model(
      id: "1",
      image: "assets/image/cam1.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "2",
      image: "assets/image/cam2.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "3",
      image: "assets/image/cam3.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "4",
      image: "assets/image/cam4.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "5",
      image: "assets/image/cam5.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "6",
      image: "assets/image/cam1.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),

    catagory_model(
      id: "7",
      image: "assets/image/cam5.jpg",
      name: "Camera",
      price: "43000",
      rate: "rate",
      isfav: "isfav",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Camera"))),
      body: GridView.builder(
        itemCount: cameras.length,
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
                      cameras[index].image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text((cameras[index].name)),
                        Text((cameras[index].price)),
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
