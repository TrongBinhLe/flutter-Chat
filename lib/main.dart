import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/authScreen.dart';
import 'package:flutter_app_chat/screens/chatScreen.dart';
import 'package:flutter_app_chat/screens/splashScreen.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }

            if (snapshot.hasData) {
              return const ChatScreen();
            }
            return const AuthScreen();
          }),
        ));
  }
}
