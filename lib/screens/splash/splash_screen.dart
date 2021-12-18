import 'package:fakestore2/model/product.dart';

import '../../screens/home/home_screen.dart';

import '../../model/api_response.dart';
import '../../services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProductService get productService => GetIt.I<ProductService>();
  APIResponse<List<String>>? _apiResponseCategories;
  APIResponse<List<Product>>? _apiResponseProducts;

  void _getAllData() async {
    setState(() {});
    _apiResponseCategories = await productService.getAllCategories();
    _apiResponseProducts = await productService.getAllProducts();

    setState(() {});
    Navigator.of(context).pushNamed(HomeScreen.routeName,
        arguments: _apiResponseCategories!.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          height: 100,
          width: 100,
          image: AssetImage("assets/images/fakestorelogo.jpg"),
        ),
      ),
    );
  }
}
