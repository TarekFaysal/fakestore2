import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>? categories =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
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
              .map((e) => Center(
                    child: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
