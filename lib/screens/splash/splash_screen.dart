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

  void _getAllCategories() async {
    setState(() {});
    _apiResponseCategories = await productService.getAllCategories();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
