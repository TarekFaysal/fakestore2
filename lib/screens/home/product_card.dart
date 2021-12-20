import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? image;
  final double? price;

  const ProductCard({
    this.image,
    this.price,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image(
                  height: 150,
                  width: 150,
                  image: NetworkImage(image!),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white54,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  "\$ " + price.toString(),
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(5),
              child: Text(
                title!,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ))
        ],
      ),
    );
  }
}
