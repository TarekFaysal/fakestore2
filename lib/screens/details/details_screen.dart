import 'package:fakestore2/model/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              image: NetworkImage(product.iamge!),
            ),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    product.title!,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.all(Radius.circular(26))),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "\$" + product.price.toString(),
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.deepOrange,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.deepOrange,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))),
              ],
            ),
            Container(
              height: 20,
            ),
            Text(product.description!),
            Container(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Add to Cart"),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey)))))
          ]),
        ),
      ),
    );
  }
}
