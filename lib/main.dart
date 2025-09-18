import 'package:flutter/material.dart';
import 'package:quick_shopping/Presentation/Onboarding_page.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/LoginPage.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/RegisterPage.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/Varification_page.dart';

import 'Presentation/Pages/App_Views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homepage(),
    );
  }
}

