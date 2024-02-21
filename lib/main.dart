import 'package:flutter/material.dart';
import 'screens/authScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.red,
      ),
      home: AuthScreen(),
    );
  }
}
