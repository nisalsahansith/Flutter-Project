import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_application/screens/login_page.dart';

void main() {
  runApp(
    ProviderScope(child: //Add Provider Scope
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {'login': (context) => Login()},
      )
    )
  );
}
