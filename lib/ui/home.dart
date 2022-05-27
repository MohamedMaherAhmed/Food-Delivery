import 'package:flutter/material.dart';
import 'package:food_delivery/utils/global_vars.dart' as global;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: global.categoriesList![0].catName == null
            ? const CircularProgressIndicator()
            : Text(global.categoriesList![0].catName!),
      ),
    );
  }
}
