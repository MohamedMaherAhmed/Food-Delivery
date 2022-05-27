import 'package:flutter/material.dart';
import 'package:food_delivery/utils/global_vars.dart' as global;

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({Key? key}) : super(key: key);

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {

  @override
  void initState() {
    super.initState();
    global.firstTimeDoneCounter++;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
