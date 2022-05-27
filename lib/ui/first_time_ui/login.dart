import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery/utils/back_end_const_vars.dart' as backend;
import 'package:food_delivery/utils/global_vars.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// Is called when pressed login button
  /// what will be sent as param -> global.getLoginMethod(param) at the func call
  /// param -> global.userList![0].email only
  Future<void> login(Map<String, dynamic> getLogin) async {
    final response = await http.post(
      Uri.parse(backend.url),
      body: getLogin,
    );

    /// if response is successful take only these info from the Json object
    /// name , email , mobile <- all string
    if (response.statusCode == 200) {
      global.respMap = jsonDecode(response.body);

      global.saveUserInfo();

      global.getSharedPreferencesInstance();
      global.prefs?.setBool('loggedIn', true);

      /// stupid code line , change the destination here to the first tutorial page
      Navigator.pushNamed(context, 'Login');
    } else {
      throw Exception('RESPONSE STATUS: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    global.firstTimeDoneCounter++;
    global.dynamicDelay(milliSec: 50);
    global.postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
