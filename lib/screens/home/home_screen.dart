import 'package:fakestore2/model/products_categories.dart';
import 'package:fakestore2/screens/home/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductAndCategories productAndCategories =
        ModalRoute.of(context)!.settings.arguments as ProductAndCategories;
    var categories = productAndCategories.categories;
    var products = productAndCategories.products;

    return DefaultTabController(
      length: categories!.length,
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Fake Store"),
          centerTitle: true,
          bottom: TabBar(
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              tabs: categories.map((e) => Tab(child: Text(e))).toList()),
        ),
        body: TabBarView(
          children: categories
              .map(
                (e) => GridView.builder(
                    itemCount: products?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      // crossAxisSpacing: 50,
                      childAspectRatio: 2.2 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        title: products![index].title,
                        image: products[index].iamge,
                        price: products[index].price,
                      );
                    }),
              )
              .toList(),
        ),
      ),
    );
  }
}
