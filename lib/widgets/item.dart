// import 'package:flutter/material.dart';
//
// import '../core/space.dart';
// import '../core/textstyle.dart';
// import '../model/models.dart';
// import '../page/details.dart';
//
// class ItemCard extends StatefulWidget {
//   final Model model;
//   const ItemCard({Key? key, required this.model}) : super(key: key);
//
//   @override
//   State<ItemCard> createState() => _ItemCardState();
// }
//
// class _ItemCardState extends State<ItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//       //  Navigator.push(context,
//            // MaterialPageRoute(builder: (builder) => DetailsPage(model: widget.model)));
//       },
//       child: Container(
//         height: 140.0,
//         margin: EdgeInsets.only(bottom: 30.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 140.0,
//               child: Image.asset(widget.model.images[0]),
//             ),
//             Container(
//               width: 180.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.model.name,
//                     style: itemCardHeading,
//                   ),
//                   SpaceVH(height: 10.0),
//                   Text(
//                     widget.model.description,
//                     maxLines: 3,
//                     style: itemCardDes,
//                   ),
//                   SpaceVH(height: 20.0),
//                   Text(
//                     widget.model.price,
//                     style: itemCardPrice,
//                   )
//                 ],
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               splashColor: Colors.transparent,
//               icon: Icon(
//                 Icons.favorite_border_outlined,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }