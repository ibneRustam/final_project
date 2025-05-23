// import 'package:flutter/material.dart';

// class Mobiles extends StatelessWidget {
//   const Mobiles({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final accessories = [
//       {
//         'image': 'assets/image/mbl1.png',
//         'title': 'Back Cover',
//         'price': '\$8.00',
//         'oldPrice': '\$12.00',
//         'discount': '30% Off',
//         'isFav': true,
//       },
//       {
//         'image': 'assets/image/mbl2.jpg',
//         'title': 'Wireless Earbuds',
//         'price': '\$25.00',
//         'oldPrice': null,
//         'isFav': false,
//       },
//       {
//         'image': 'assets/image/mbl3.jpg',
//         'title': 'Fast Charger',
//         'price': '\$15.00',
//         'oldPrice': '\$20.00',
//         'discount': '25% Off',
//         'isFav': false,
//       },
//       {
//         'image': 'assets/image/mbl4.jpg',
//         'title': 'Power Bank',
//         'price': '\$18.00',
//         'oldPrice': null,
//         'isFav': true,
//       },
//       {
//         'image': 'assets/image/mbl5.jpg',
//         'title': 'Power Bank',
//         'price': '\$18.00',
//         'oldPrice': null,
//         'isFav': true,
//       },
//       {
//         'image': 'assets/image/mbl6.jpg',
//         'title': 'Power Bank',
//         'price': '\$18.00',
//         'oldPrice': null,
//         'isFav': true,
//       },
//     ];

//     final screenWidth = MediaQuery.of(context).size.width;
//     final crossAxisCount = screenWidth < 600 ? 2 : 3;
//     final aspectRatio = screenWidth < 600 ? 0.65 : 0.75;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Mobile Accessories",
//           style: TextStyle(color: Colors.black),
//         ),
//         iconTheme: const IconThemeData(color: Colors.black),
//         actions: const [
//           Icon(Icons.favorite_border, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.filter_list, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: accessories.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxisCount,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             childAspectRatio: aspectRatio,
//           ),
//           itemBuilder: (context, index) {
//             final item = accessories[index];
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image section
//                   Expanded(
//                     flex: 6,
//                     child: Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             topRight: Radius.circular(12),
//                           ),
//                           child: Image.asset(
//                             item['image']! as String,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         if (item['discount'] != null)
//                           Positioned(
//                             top: 8,
//                             left: 8,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                               decoration: BoxDecoration(
//                                 color: Colors.redAccent,
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Text(
//                                 item['discount']! as String,
//                                 style: const TextStyle(color: Colors.white, fontSize: 10),
//                               ),
//                             ),
//                           ),
//                         Positioned(
//                           top: 8,
//                           right: 8,
//                           child: Icon(
//                             item['isFav'] == true ? Icons.favorite : Icons.favorite_border,
//                             color: item['isFav'] == true ? Colors.red : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Title
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       item['title']! as String,
//                       style: const TextStyle(color: Colors.black),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   // Price
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           item['price']! as String,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(width: 6),
//                         if (item['oldPrice'] != null)
//                           Text(
//                             item['oldPrice']! as String,
//                             style: const TextStyle(
//                               color: Colors.redAccent,
//                               decoration: TextDecoration.lineThrough,
//                               fontSize: 12,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }








