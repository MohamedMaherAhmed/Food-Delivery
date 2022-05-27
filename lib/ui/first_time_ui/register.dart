import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivery/utils/back_end_const_vars.dart' as backend;
import 'package:food_delivery/utils/global_vars.dart' as global;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  /// Is called when clicking the Register save button
  /// sends the data entered which are name,email & mobile
  /// you call this function like so registerPostData(param);
  /// param -> global.getRegisterMethod(params)
  /// params -> registerName: registerNameTextEditingController.text,
  /// registerEmail: registerEmailTextEditingController.text,
  /// registerMobile: registerMobileTextEditingController.text,
  Future<void> registerPostData(Map<String, dynamic> getRegisterMethodRequestParam) async {
    final response = await http.post(
      Uri.parse(backend.url),
      body: getRegisterMethodRequestParam,
    );

    if (response.statusCode == 200) {
      global.respMap = jsonDecode(response.body);

      global.saveUserInfo();

    } else {
      throw Exception('RESPONSE STATUS: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}





