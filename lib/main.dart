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

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDartColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChat',
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDartColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDartColorScheme.secondary,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDartColorScheme.primaryContainer,
              foregroundColor: kDartColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          // primarySwatch: Colors.yellow,
          // primaryColor: Colors.red,
        ).copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondary,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 14),
              ),
        ),
        themeMode: ThemeMode.system,
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
