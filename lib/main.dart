import 'package:flutter/material.dart';
import 'package:my_flutter_application/screens/_login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context)=>Login()
    }
  ));
}
