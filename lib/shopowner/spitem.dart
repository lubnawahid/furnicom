import 'package:flutter/material.dart';
import 'package:furnicom/shopowner/spdetails.dart';

import '../core/space.dart';
import '../core/textstyle.dart';
import '../model/models.dart';
import '../page/details.dart';

class SItemCard extends StatefulWidget {
  final Model model;
  const SItemCard({Key? key, required this.model}) : super(key: key);

  @override
  State<SItemCard> createState() => _SItemCardState();
}

class _SItemCardState extends State<SItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // Navigator.push(context,
           // MaterialPageRoute(builder: (builder) => SPDetailsPage()));
      },
      child: Container(
        height: 140.0,
        margin: EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140.0,
              child: Image.asset(widget.model.images),
            ),
            Container(
              width: 180.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'productname',
                    style: itemCardHeading,
                  ),
                  SpaceVH(height: 10.0),
                  Text(
                    'description',
                    maxLines: 3,
                    style: itemCardDes,
                  ),
                  SpaceVH(height: 20.0),
                  Text(
                    'price',
                    style: itemCardPrice,
                  )
                ],
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   splashColor: Colors.transparent,
            //   icon: Icon(
            //     Icons.favorite_border_outlined,
            //   ),
           // ),
          ],
        ),
      ),
    );
  }
}