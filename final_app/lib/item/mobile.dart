import 'package:final_app/class/model.dart';
import 'package:flutter/material.dart';

class Mobiles extends StatefulWidget {
  const Mobiles({super.key});

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  List<catagory_model> mobiles = [
    catagory_model(
      id: "1",
      image: "assets/image/mbl1.webp",
      name: "Samsung S24",
      price: "255,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "2",
      image: "assets/image/mbl2.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "3",
      image: "assets/image/mbl3.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "4",
      image: "assets/image/mbl4.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "5",
      image: "assets/image/mbl5.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),

    catagory_model(
      id: "6",
      image: "assets/image/mbl6.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "7",
      image: "assets/image/mbl7.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "8",
      image: "assets/image/mbl8.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "9",
      image: "assets/image/mbl9.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "10",
      image: "assets/image/mbl10.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "11",
      image: "assets/image/mbl11.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "12",
      image: "assets/image/mbl12.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "13",
      image: "assets/image/mbl13.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "14",
      image: "assets/image/mbl14.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
    catagory_model(
      id: "15",
      image: "assets/image/mbl15.webp",
      name: "Samsung A55",
      price: "135,000",
      rate: "4.5",
      isfav: "true",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Mobiles"))),
      body: GridView.builder(
        itemCount: mobiles.length,
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
                      mobiles[index].image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text((mobiles[index].name)),
                        Text((mobiles[index].price)),
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

class detailSCR extends StatefulWidget {
  const detailSCR({super.key});

  @override
  State<detailSCR> createState() => _detailSCRState();
}

class _detailSCRState extends State<detailSCR> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

