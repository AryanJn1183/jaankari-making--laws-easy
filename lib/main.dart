import 'package:flutter/material.dart';
import 'package:jaankari/chat_screen.dart';
import 'package:jaankari/home_screen.dart';
import 'package:jaankari/response_screen.dart';
import 'package:jaankari/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
        '/chat': (context) => ChatScreen(),
        '/response': (context) => ResponseScreen(),
      },
      home: ChatScreen(),
    );
  }
}
