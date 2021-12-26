import 'package:fakestore2/model/api_response.dart';
import 'package:fakestore2/model/user.dart';
import 'package:fakestore2/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  UserService get userService => GetIt.I<UserService>();
  APIResponse<User>? _apiResponseUser;
  bool _isLoading = false;
  void getUserData() async {
    setState(() {
      _isLoading = true;
    });
    //api call
    _apiResponseUser = await userService.getUserData(3);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(),
    );
  }
}
