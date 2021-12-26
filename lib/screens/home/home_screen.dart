import 'package:fakestore2/model/product.dart';
import 'package:fakestore2/model/products_categories.dart';
import 'package:fakestore2/screens/cart/cart_screen.dart';
import 'package:fakestore2/screens/details/details_screen.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Fake Store"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            )
          ],
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
                    itemCount: products!
                        .where((element) => element.category == e)
                        .toList()
                        .length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      // crossAxisSpacing: 50,
                      childAspectRatio: 2.2 / 2,
                    ),
                    itemBuilder: (context, index) {
                      List<Product> productsInCategory = products
                          .where((element) => element.category == e)
                          .toList();
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              DetailsScreen.routeName,
                              arguments: productsInCategory[index]);
                        },
                        child: ProductCard(
                          title: productsInCategory[index].title,
                          image: productsInCategory[index].iamge,
                          price: productsInCategory[index].price,
                        ),
                      );
                    }),
              )
              .toList(),
        ),
      ),
    );
  }
}
