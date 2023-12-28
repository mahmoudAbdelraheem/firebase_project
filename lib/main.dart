import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/auth/login.dart';
import 'package:firebase_project/auth/signup.dart';
import 'package:firebase_project/categories/add.dart';
import 'package:firebase_project/homepage.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDzDq7-AESCaaMz2mviCBq0pstpdp2eepo",
            appId: "1:680375052596:android:7e575433052d4884505d61",
            messagingSenderId: "680375052596",
            projectId: "fir-project-67408",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=================================User is currently signed out!');
      } else {
        print('=================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[50],
          shadowColor: Colors.yellow[300],
          elevation: 2.0,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
          iconTheme: const IconThemeData(
            color: Colors.orangeAccent,
            size: 30,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const HomePage()
          : const Login(),
      routes: {
        "SignUp": (context) => const SignUp(),
        "Login": (context) => const Login(),
        "HomePage": (context) => const HomePage(),
        "AddCategory": (context) => AddCategory(),
      },
    );
  }
}
