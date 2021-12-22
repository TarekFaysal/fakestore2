import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? title, image;
  final double? price;
  const ProductCard({
    this.title,
    this.image,
    this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(5, 5), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child:
                  Image(height: 150, width: 150, image: NetworkImage(image!)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.all(Radius.circular(26))),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "\$" + price.toString(),
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
        Container(
            alignment: Alignment.center,
            width: 200,
            padding: EdgeInsets.all(5),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              maxLines: 2,
            ))
      ]),
    );
  }
}
